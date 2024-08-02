import React from 'react'
import './BannerFilme.css'
const BannerFilme = ({nome, url, description, duracao, genero, classificacao}) => {
  return (
    <div className='banner-filme'>
      <div className="banner">
            <img className='img-banner' src={url} alt={nome}/>
            <div className="description">
                <h1 className='title-banner'>{nome}</h1>
                <p className='description-banner'>{description}</p>
                <div className='classificacao-banner'>
                    <p className='idade-banner'>{classificacao}</p>
                    <p className='genero-banner'>{genero}</p>
                </div>
            </div>
      </div>
    </div>
  )
}

export default BannerFilme
