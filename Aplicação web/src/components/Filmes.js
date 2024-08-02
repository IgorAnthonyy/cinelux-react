import React, { useEffect, useState } from 'react';
import axios from 'axios';

import './Filmes.css';
import { Link } from 'react-router-dom';

const Filmes = ({ cidade, onFilmeSelecionado }) => {
  useEffect(() => {
    document.title = "CineLux";
  }, []);
  
  const [activeButton, setActiveButton] = useState('emCartaz');
  const [data, setData] = useState([])
  const [loading, setLoading] = useState(true)
  const handleButtonClick = (buttonType) => {
    
    setActiveButton(buttonType);
  };
  
  const handleFilmeClick = (nome, url, description, duracao, genero, classificacao, id) => {
    
    onFilmeSelecionado(nome, url, description, duracao, genero, classificacao, id);
  };
  

  useEffect(() => {
    if(cidade !== undefined){
   if(activeButton === 'emCartaz'){
    axios.get(`http://localhost:8080/filmes/${cidade}/emCartaz`)
    .then(response => {
        console.log('filmes', response.data);
        setData(response.data)
        setLoading(false)
        
    })
    .catch(error => {
        console.error('Erro ao enviar requisição:', error);
    });
   }else {
    axios.get(`http://localhost:8080/filmes/${cidade}/emBreve`)
    .then(response => {
      console.log('no ebreve');
        console.log('filmes em breve', response.data);
        setData(response.data)
        setLoading(false)
        
    })
    .catch(error => {
        console.error('Erro ao enviar requisição:', error);
    });
   }
  }
    }, [cidade, activeButton]); 

  return (
    <div className="filme">
      <div className="container-filme">
        <div className="col-btn-1">
          <button
            style={{
              fontWeight: activeButton === 'emCartaz' ? 'bold' : 'normal',
              fontSize: activeButton === 'emCartaz' ? '23px' : '20px',
              borderBottom: activeButton === 'emCartaz' ?  '6px solid #FFC100' : 'none'
            }}
            className="btn-filmes emCartaz"
            onClick={() => handleButtonClick('emCartaz')}
          >
            Em cartaz
          </button>
          <button
            style={{
              fontWeight: activeButton === 'emBreve' ? 'bold' : 'normal',
              fontSize: activeButton === 'emBreve' ? '23px' : '20px',
              borderBottom: activeButton === 'emBreve' ?  '6px solid #FFC100' : 'none'
            }}
            className="btn-filmes emBreve"
            onClick={() => {
              handleButtonClick('emBreve')
             
            }}
          >
            Em breve
          </button>
        </div>
        <div className="filmes-container-list">
          {loading && <p>Carregando...</p>}
          {data.map((d) => {
           
              return (
                <div key={d.idFilme} className="filme-item">
                  <Link
                    onClick={() => handleFilmeClick(d.titulo, d.capa, d.descricao, d.duracaoMin, d.genero, d.classificacao, d.idFilme)}
                    to={'/filme'}
                    className='buttonFilme'
                  >
                    <img className='imgFilme' src={d.capa} alt={d.titulo} />
                    <p className='nome-filme'>{d.titulo}</p>
                  </Link>
                </div>
              );
            }
       
          )}
        </div>
      </div>
    </div>
  );
};

export default Filmes;
