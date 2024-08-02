import React from 'react'
import { useParams } from 'react-router-dom'
import HeaderLoginCadastro from './components/HeaderLoginCadastro'
import MenuLateralComprar from './components/MenuLateralComprar'
import Assentos from './components/Assentos'

const ComprarIngresso = ({cidade, nome ,url}) => {
    const { idSessao } = useParams()
   
  return (
    <div style={{padding: '30px'}}>
      <HeaderLoginCadastro data='Escolha os assentos'/>
      <div style={{display: 'flex', marginTop: '90px', justifyContent: 'center'}}>
        <MenuLateralComprar cidade={cidade} nome={nome} url={url}/>
        <Assentos/>
      </div>
    </div>
  )
}

export default ComprarIngresso
