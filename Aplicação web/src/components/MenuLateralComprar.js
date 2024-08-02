import React from 'react'
import './MenuLateralCompra.css'
import { useParams } from 'react-router-dom';
const MenuLateralComprar = ({cidade, nome ,url}) => {
  const {hora} = useParams()

  const horaSplit = hora.split(',')
  const dia = horaSplit[1].split(' ')
  console.log('dia', dia);
  return (
    <div className='menu'>
      <h2 className='titulo-compra'>RESUMO DA COMPRA</h2>
      <div className="description-menu">
        <div className="menu-item">
            <img src={url} alt="aaa" />
            <p>{nome}</p>
        </div>
        <div className="menu-item">
            <div className="bg-col">
            <i className='tam'>{dia[1]}</i>
            </div>
            <p>{dia[2]}</p>
        </div>
        <div className="menu-item">
            <div className="bg-col">
            <i className='bx bx-map'></i>
            </div>
            <p>{cidade[0]}</p>
        </div>
      </div>
    </div>
  )
}

export default MenuLateralComprar
