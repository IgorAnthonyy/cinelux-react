import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate, Link } from 'react-router-dom';
import '../components/BoxLogin.css'
import Swal from 'sweetalert2'



const BoxLogin = () => {

  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");


  
  const [emailVisible, setEmailVisible] = useState(false);
  
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
   
    console.log('teste', email, senha);

    const data = {
      email: email,
      senha: senha
  };
  
  axios.post('http://localhost:8080/cliente/autenticar', data)
      .then(response => {
        console.log('response', response.data);
          if(response.data.mensagem === 'Autenticado com sucesso'){
            const Toast = Swal.mixin({
              toast: true,
              position: "top-end",
              background: '#2F2D2A',
              color: '#fff',
              showConfirmButton: false,
              timer: 2000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
              }
            });
            Toast.fire({
              iconColor: "#FFD54F",
              icon: "success",
              title: "Login realizado com sucesso!"
            });
            setEmail("");
            setSenha("");
            sessionStorage.ID_USUARIO = response.data.cliente.id
            sessionStorage.USUARIO = email
            sessionStorage.LOGADO = true
            setTimeout(()=>{navigate('/')}, 2000)
          }

          if(response.data.mensagem === 'Credenciais inválidas'){
            setEmailVisible(true)
           }else setEmailVisible(false)

      })
      .catch(error => {
          console.error('Erro ao enviar requisição:', error);
       
      });

    
   
  };
  return (
   
      <div className='box-login'>

      <div className="form-box">
      

        <form onSubmit={handleSubmit}>
          <div>
            <label htmlFor="email">E-mail ou Nome de usuário</label>
            <div className="input-icon">
            <i class='bx bx-user'></i>
            <input type="text" name="email" placeholder="Digite seu e-mail ou nome de usuário" value={email} onChange={(e) => setEmail(e.target.value)} />
            </div>
          </div>
            <div>
              <label htmlFor="senha">Senha</label>
              <div className="input-icon">
              <i class='bx bx-lock-alt'></i>
              <input type="password" name="senha" placeholder="Digite sua senha" value={senha} onChange={(e) => setSenha(e.target.value)} />
              </div>
         
            </div>          
            {emailVisible && (<p className='alert-input'>Credenciais inválidas</p>)}
          <input type="submit" value={'Entrar'} className='btnSubmit' />
        </form>
      <div className="cadastro-msg">
        <p>Não tem conta? <Link to="/cadastrar">Cadastrar-se</Link></p>
      </div>
      </div>
    </div>
  )
}

export default BoxLogin
