import React, { useEffect, useState } from 'react';
import './SessoesFilme.css';
import axios from 'axios';
import { Link } from 'react-router-dom';


const SessoesFilme = ({ idFilme, idCinema }) => {
    const [modalHoraOpen, setModalHoraOpen] = useState(false);
    const [modalTipoOpen, setModalTipoOpen] = useState(false);

    const [dataHora, setDataHora] = useState('');
    const tipo = ['Todos', '3D', '2D'];
    const [horas, setHoras] = useState([]);
    const [dataTipo, setDataTipo] = useState(tipo[0]);
    const [sessoes, setSessoes] = useState([])
    
    useEffect(() => {
        axios.get(`http://localhost:8080/sessoes/cinema/${idCinema}/filme/${idFilme}`)
        .then(response => {
            const fetchedHoras = response.data;
           
            setHoras(fetchedHoras);
            if (dataHora === '' && fetchedHoras.length > 0) {
                setDataHora(fetchedHoras[0][0]);
            }
        })
        .catch(error => {
            console.error('Erro ao enviar requisição:', error);
        });
    }, [dataHora, idCinema, idFilme]); 
    
    function formatDate(dateString) {
        const daysOfWeek = ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"];
    const months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"];
    
    const date = new Date(dateString);
    
    const utcDate = new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate());
    
    const dayOfWeek = daysOfWeek[utcDate.getUTCDay()];
    const day = utcDate.getUTCDate();
    const month = months[utcDate.getUTCMonth()];
    
    return `${dayOfWeek}, ${day} ${month}`;
    }
    

    useEffect(() => {
     
        if(dataHora !== "" ){
            const filtro = {
                data: dataHora,
                tipoSessao: dataTipo,
                idCinema: idCinema,
                idFilme: idFilme
              }
            
            console.log('response filtroaaa', filtro);
            axios.post(`http://localhost:8080/sessoes/filtro`, filtro)
            .then(response => {
                console.log('response filtrobbbb', response.data);
                setSessoes(response.data)
            })
            .catch(error => {
                console.error('Erro ao enviar requisição:', error);
            });
        }
    }, [dataHora, dataTipo, idCinema, idFilme]); 

    return (
        <div className='sessao'>
            <h1 style={{fontSize: '28px'}}>Escolha o <span className="destac">horario</span> e o tipo de <span className="destac">sessão</span></h1>
            <div style={{display: 'flex',
                
                gap: '20px',
                height: '70px'
            }}>
            <div className="escolherHora">
                <button className='btnHoraSessao' onClick={() => setModalHoraOpen(!modalHoraOpen)}>
                    {formatDate(dataHora)} {modalHoraOpen ? (<i className='bx bx-chevron-right' style={{color: '#000'}}></i>) : (<i className='bx bx-chevron-down' style={{color: '#000'}}></i>)}
                </button>
                {modalHoraOpen && (
                    <div className="horarios">
                        {horas.map((h, i) => (
                            
                            
                            <button key={i} value={h} onClick={(e) => {
                                setDataHora(e.target.value);
                                setModalHoraOpen(false);
                               
                            }}>
                                {formatDate(h)}
                            </button>
                        ))}
                    </div>
                )}
            </div>
            <div className="escolherTipo">
                <button className='btnTipoSessao' onClick={() => setModalTipoOpen(!modalTipoOpen)}>
                    {dataTipo} {modalTipoOpen ? (<i className='bx bx-chevron-right'></i>) : (<i className='bx bx-chevron-down'></i>)}
                </button>
                {modalTipoOpen && (
                    <div className="tipos">
                        {tipo.map((t) => (
                            <button key={t} value={t} onClick={(e) => {
                                setDataTipo(e.target.value);
                                setModalTipoOpen(false);
                            }}>
                                {t}
                            </button>
                        ))}
                    </div>
                )}
            </div>
            </div>
            <h1 style={{fontSize: '28px'}}>Horários disponíveis</h1>

            <div className="box-sessao">
            {sessoes.map((sessao)=>{
                const sep = sessao.dataHora.split(' ')
               
                const dateFormat = formatDate(sep[0])
                return <Link className='sessao-item' key={sessao.idSessao} to={`/comprar-ingresso/${sessao.idSessao}/${sessao.idSala}/${dateFormat}/${sessao.tipoSessao}`}>
                <p className='titulo-data'>{dateFormat}</p>
                <p className='titulo-hora'>{sep[1]}</p>
                <p>{sessao.tipoSessao}</p>
            </Link>
            }
                
            )}
            </div>
        </div>
    );
}

export default SessoesFilme;
