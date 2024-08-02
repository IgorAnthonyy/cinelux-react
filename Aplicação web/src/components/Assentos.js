import React, { useEffect, useState } from 'react';
import './Assentos.css';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import Swal from 'sweetalert2';
import { useNavigate } from 'react-router-dom';
import withReactContent from 'sweetalert2-react-content';

const Assentos = () => {
  const { idSessao, idSala, hora, tipo } = useParams();
  const [assentos, setAssentos] = useState([]);
  const [maxRow, setMaxRow] = useState('A');
  const [maxColumn, setMaxColumn] = useState(1);
  const [json, setJson] = useState([]);
  const [preco, setPreco] = useState('');
  const [selectedSeats, setSelectedSeats] = useState([]);

  useEffect(() => {
    axios.get(`http://localhost:8080/precos`)
      .then(response => {
        const splitHour = hora.split(',');
        const precoUnitario = response.data;
        precoUnitario.forEach(element => {
          if (element.dia === splitHour[0]) {
            setPreco(element.preco);
            if (tipo === '3D') {
              setPreco(preco + 10);
            }
          }
        });
      })
      .catch(error => {
        console.error('Erro ao enviar requisição:', error);
      });
  }, [hora, tipo]);

  useEffect(() => {
    axios.get(`http://localhost:8080/assento/sessao/${idSessao}/sala/${idSala}`)
      .then(response => {
        const assentos = response.data;
        setAssentos(assentos);
        console.log('assentos', assentos);
        const rows = assentos.map(a => a.numero[0]);
        const columns = assentos.map(a => parseInt(a.numero.slice(1)));

        const maxRow = String.fromCharCode(Math.max(...rows.map(r => r.charCodeAt(0))));
        const maxColumn = Math.max(...columns);

        setMaxRow(maxRow);
        setMaxColumn(maxColumn);
      })
      .catch(error => {
        console.error('Erro ao enviar requisição:', error);
      });
  }, [idSessao, idSala]);

  const totalRows = maxRow.charCodeAt(0) - 'A'.charCodeAt(0) + 1;
  const totalColumns = maxColumn;

  const rows = Array.from({ length: totalRows }, (_, i) => String.fromCharCode(65 + i));
  const columns = Array.from({ length: totalColumns }, (_, i) => i + 1);
  const navigate = useNavigate();

  function handleBuyTicket() {
    console.log('buy', json);
    axios.post('http://localhost:8080/ingresso', json)
      .then(response => {
        if (response.data.mensagem) {
          const MySwal = withReactContent(Swal)
          Swal.fire(
            {
              title: "Ingresso comprado com sucesso!",
              background: '#2F2D2A',
              color: '#fff',
              confirmButtonText: 'Comprovante',
              confirmButtonColor: '#FFD54F'
            }
          ).then((result) => {
            if (result.isConfirmed) {
              navigate('/login');
            }
          });
        }
      })
      .catch(error => {
        console.error('Erro ao enviar requisição:', error);
      });
  }

  const handleSeatClick = (seatNumber, assento) => {
    if (sessionStorage.getItem('USUARIO') === null) {
      const MySwal = withReactContent(Swal);
      Swal.fire(
        {
          title: "Você precisa estar logado para fazer essa ação!",
          background: '#2F2D2A',
          color: '#fff',
          confirmButtonColor: '#FFD54F'
        }
      ).then((result) => {
        if (result.isConfirmed) {
          navigate('/login');
        }
      });
    } else {
      const seatId = assento.idAssento !== undefined ? assento.idAssento : seatNumber;
      const isSelected = selectedSeats.includes(seatNumber);
      
      if (isSelected) {
        setSelectedSeats(selectedSeats.filter(seat => seat !== seatNumber));
        setJson(json.filter(item => item.assento !== seatId));
      } else {
        setSelectedSeats([...selectedSeats, seatNumber]);
        const agora = new Date();
        const horaAtual = agora.toLocaleTimeString();
        let novoPreco = preco;
        if (assento.tipo === 'vip') {
          novoPreco = preco * 1.1;
          setPreco(novoPreco);
        }
        const data = {
          dataHora: horaAtual,
          cliente: Number(sessionStorage.ID_USUARIO),
          sessao: Number(idSessao),
          assento: Number(seatId),
          total: novoPreco
        };
        setJson([...json, data]);
        console.log('json', json);
      }
    }
  };

  return (
    <div className="assentos-container">
      <h2>Escolha o Seu Assento</h2>
      <div className="assentos-grid" style={{ gridTemplateColumns: `repeat(${columns.length + 1}, 30px)` }}>
        <div className="grid-label"></div>
        {columns.map((col) => (
          <div key={col} className="grid-label">{col}</div>
        ))}
        {rows.map((row) => (
          <React.Fragment key={row}>
            <div className="grid-label">{row}</div>
            {columns.map((col) => {
              const seatNumber = `${row}${col}`;
              const assento = assentos.find(a => a.numero === seatNumber);
              const isSelected = selectedSeats.includes(seatNumber);

              return (
                <button
                  key={seatNumber}
                  value={assento && assento.idAssento !== undefined ? assento.idAssento : seatNumber}
                  className={`assento ${assento ? (assento.disponivel ? 'disponivel' : 'ocupado') : ''} ${assento && assento.tipo ? assento.tipo : ''} ${isSelected ? 'selecionado' : ''}`}
                  onClick={() => handleSeatClick(seatNumber, assento)}
                  disabled={assento ? !assento.disponivel : true}
                >
                </button>
              );
            })}
          </React.Fragment>
        ))}
      </div>
      <div className="legenda">
        <div className="col-assento" style={{ marginBottom: '30px' }}>
          <div className="assento-disponivel vip"></div><p>Ingresso vip</p>
          <div className="assento-disponivel normal"></div><p>Ingresso normal</p>
        </div>
        <div className="col-assento">
          <div className="assento-disponivel"></div><p>Disponível</p>
        </div>
        <div className="col-assento">
          <div className="assento-indisponivel"></div><p>Indisponível</p>
        </div>
        <div className="col-assento">
          <div className="assento-selecionado"></div><p>Selecionado</p>
        </div>
      </div>
      <div className="btnComprar">
        {json.length > 0 && <button onClick={handleBuyTicket}>Comprar Ingresso</button>}
      </div>
    </div>
  );
};

export default Assentos;
