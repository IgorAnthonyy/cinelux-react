import { useState } from 'react';
import './App.css';
import Filmes from './components/Filmes';
import Header from './components/Header';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Login from './Login';
import Cadastrar from './Cadastrar';
import SpecificFilm from './SpecificFilm';
import ComprarIngresso from './ComprarIngresso';
import Conta from './Conta';

function App() {
  
  const [dataCidade, setDataCidade] = useState(['Carregando....'])
  const [dataFilmeSelecionado, setDataFilmeSelecionado] = useState([])
  const hanleDataChange = (data) =>{
    // console.log('pai', data);
    setDataCidade(data)
  }
  const hanleFilme = (nome, url, description, duracao, genero, classificacao, idFilme) =>{
    setDataFilmeSelecionado([])
    setDataFilmeSelecionado(prev => [...prev, nome, url, description, duracao, genero, classificacao, idFilme, dataCidade[1]])
  }
  const getUser = sessionStorage.getItem('USUARIO');
  console.log(getUser);
  return (
    <BrowserRouter>
      <Routes>
          <Route path='/' element={
            <div className="App">
                <Header onDataChanged={hanleDataChange}/>
                <h2 className="title-container-filme">
                    Filmes - {dataCidade[0]}
                  </h2>
                {dataCidade !== '' && <Filmes cidade={dataCidade[1]} onFilmeSelecionado={hanleFilme}/>}
              </div>}/>
          <Route path='/login' element={!getUser ? <Login/> : <Navigate to='/'/>}/>
          <Route path='/cadastrar' element={!getUser ? <Cadastrar/> : <Navigate to='/'/>}/>
          <Route path='/filme' element={<SpecificFilm filmeSelecionado={dataFilmeSelecionado} />}/>
          <Route path='/conta/:nomeConta' element={<Conta/>}/>
          <Route path='/comprar-ingresso/:idSessao/:idSala/:hora/:tipo'  element={<ComprarIngresso cidade={dataCidade} nome={dataFilmeSelecionado[0]} url={dataFilmeSelecionado[1]}/>} />
      </Routes>
    </BrowserRouter>
    
  );
}

export default App;
