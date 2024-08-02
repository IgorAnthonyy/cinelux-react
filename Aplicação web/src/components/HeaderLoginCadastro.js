import React from 'react'
import { Link } from 'react-router-dom'
import './HeaderLoginCadastro.css'
const HeaderLoginCadastro = ({data}) => {
  return (
    <div className='headerLoginCadastro'>
        <div className="container-col1">
            <div className="col-2-link">
                <Link className='btnVoltar' to={'/'}><i className='bx bx-undo'></i></Link>
            </div>
            <h3>{data}</h3>
        </div>
        
    </div>
  )
}

    export default HeaderLoginCadastro
