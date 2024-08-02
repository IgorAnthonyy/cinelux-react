import React from 'react'
import './HeaderFilmes.css'
import logo from '../assets/logo.svg'
import { Link } from 'react-router-dom'

const HeaderFilmes = () => {
  return (
    <div className='header-filmes'>
      <div className="container-filmes">
            <Link to={'/'}><img src={logo} alt="aa" /></Link>
      </div>
    </div>
  )
}

export default HeaderFilmes
