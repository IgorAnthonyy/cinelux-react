import React, { useEffect } from 'react'
import BoxCadastro from './components/BoxCadastro'
import HeaderLoginCadastro from './components/HeaderLoginCadastro'
const Cadastrar = () => {
  useEffect(() => {
    document.title = "CineLux - Cadastro";
  }, []);
  return (
    <div>
      <HeaderLoginCadastro data={'Cadastro'}/>
      <BoxCadastro/>
    </div>
  )
}

export default Cadastrar
