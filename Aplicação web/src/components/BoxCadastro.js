import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import Swal from 'sweetalert2'
import InputMask from 'react-input-mask';

import './BoxCadastro.css';

const BoxCadastro = () => {
  const [nomeCompleto, setNomeCompleto] = useState("");
  const [nomeDeUsuario, setNomeDeUsuario] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [telefone, setTelefone] = useState("");
  const [cpf, setCpf] = useState("");

  const [nomeCompletoVisible, setNomeCompletoVisible] = useState(false);
  const [nomeDeUsuarioVisible, setNomeDeUsuarioVisible] = useState(false);
  const [emailVisible, setEmailVisible] = useState(false);
  const [senhaVisible, setSenhaVisible] = useState(false);
  const [telefoneVisible, setTelefoneVisible] = useState(false);
  const [cpfVisile, setCpfVisible] = useState(false);
  
  const [mensagemErroEmail, setMensagemErroEmail] = useState("E-mail inválido")
  const [mensagemErroUsername, setMensagemErroUsername] = useState("Nome de usuário inválido")

  const handleTelefoneChange = (e) => {
    const maskedValue = e.target.value;
    const cleanedValue = maskedValue.replace(/[^\d]/g, '');
    setTelefone(cleanedValue)
  };
  const navigate = useNavigate();
  const handleCpfChange = (e) => {
    const maskedValue = e.target.value;
    const cleanedValue = maskedValue.replace(/[^\d]/g, ''); 
    setCpf(cleanedValue);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
  
    let isValid = true;

    if (nomeCompleto.length < 3) {
      setNomeCompletoVisible(true);
      isValid = false;
    } else {
      setNomeCompletoVisible(false);
    }

    if (nomeDeUsuario.length < 3) {
      setNomeDeUsuarioVisible(true);
      isValid = false;
    } else {
      setNomeDeUsuarioVisible(false);
    }

    if (!email.includes('@')) {
      setEmailVisible(true);
      isValid = false;
    } else {
      setEmailVisible(false);
    }

    if (senha.length < 6) {
      setSenhaVisible(true);
      isValid = false;
    } else {
      setSenhaVisible(false);
    }

    if (telefone.length !== 11) {
      setTelefoneVisible(true);
      isValid = false;
    } else {
      setTelefoneVisible(false);
    }

    if (cpf.length !== 11) {
      setCpfVisible(true);
      isValid = false;
    } else {
      setCpfVisible(false);
    }

    if (isValid) {
      const data = {
        nome: nomeCompleto,
        username: nomeDeUsuario,
        email: email,
        senha: senha,
        telefone: telefone,
        cpf: cpf
      };
      
      axios.post('http://localhost:8080/cliente/cadastrar', data)
        .then(response => {
          

          if(response.data.mensagem === 'Username já existe'){
            setMensagemErroUsername("Nome de usuário já existe");
            setNomeDeUsuarioVisible(true);
          } else if(response.data.mensagem === 'já existe uma conta vinculada a esse email'){
            setMensagemErroEmail('Já existe uma conta vinculada a esse email');
            setEmailVisible(true);
          } else if(response.data.mensagem === 'Usuário cadastrado'){
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
              title: "Cadastro realizado com sucesso!"
            });
            setNomeCompleto("");
            setNomeDeUsuario("");
            setEmail("");
            setSenha("");
            setTelefone("");
            setCpf("");
            setTimeout(()=>{navigate('/login')}, 2000)

          }
        
  })
  .catch(error => {
      console.error('Erro ao enviar requisição:', error);
   
  });
  } else {
    console.log('Preencha todos os campos');
  }
  
};

  return (
    <div className='box-cadastro'>
      {/* <img className='imgPopcorn' src={imgLogin} alt="" /> */}
      <div className="form-box">
        
        <form onSubmit={handleSubmit}>
          <div>
            <label htmlFor="name">Nome completo</label>
            <div className="input-icon">
            <i class='bx bx-user'></i>
            <input type="text" name="name" placeholder="Digite seu nome completo" value={nomeCompleto} onChange={(e) => setNomeCompleto(e.target.value)} />
            </div>
            {nomeCompletoVisible && (<p className='alert-input'>Nome completo inválido</p>)}
          </div>
          <div>
            <label htmlFor="name">Nome de usuário</label>
            <div className="input-icon">
            <i class='bx bx-user'></i>
            <input type="text" name="name" placeholder="Digite seu nome de usuário" value={nomeDeUsuario} onChange={(e) => setNomeDeUsuario(e.target.value)} />

            </div>
            {nomeDeUsuarioVisible && (<p className='alert-input'>{mensagemErroUsername}</p>)}
          </div>
          <div>
            <label htmlFor="email">E-mail</label>
            <div className="input-icon">
            <i class='bx bx-envelope'></i>
            <input type="email" name="email" placeholder="Digite seu e-mail" value={email} onChange={(e) => setEmail(e.target.value)} />
            </div>
            {emailVisible && (<p style={{width: '100%'}} className='alert-input'>{mensagemErroEmail}</p>)}
          </div>
          <div className="box-flex">
            <div>
              <label htmlFor="senha">Senha</label>
              <div className="input-icon">
              <i class='bx bx-lock-alt'></i>
              <input type="password" className='iptSenha' name="senha" placeholder="Digite sua senha" value={senha} onChange={(e) => setSenha(e.target.value)} />
              </div>
              {senhaVisible && (<p className='alert-input'>Senha deve ter pelo menos 6 caracteres</p>)}

            </div>
            <div>
              <label htmlFor="telefone">Telefone</label>
              <div className="input-icon">
              <i class='bx bx-phone'></i>
              <InputMask 
                mask="(99) 99999-9999" 
                value={telefone} 
                onChange={handleTelefoneChange} 
                onBlur={handleTelefoneChange}
              >
                {(inputProps) => <input {...inputProps} type="text" className='iptTelefone' name="telefone" placeholder="Digite seu telefone" />}
              </InputMask>
              </div>
            {telefoneVisible && (<p className='alert-input'>Telefone inválido</p>)}
             
            </div>
          </div>
          <div>
            <label htmlFor="cpf">Cpf</label>
            <div className="input-icon">
            <i class='bx bxs-id-card'></i>
            <InputMask 
              mask="999.999.999-99" 
              value={cpf} 
              onChange={handleCpfChange} 
              onBlur={handleCpfChange}
            >
              {(inputProps) => <input {...inputProps} type="text" name="cpf" placeholder="Digite seu cpf" />}
            </InputMask>

            </div>
            {cpfVisile && (<p className='alert-input'>Nome de usuário inválido</p>)}
          </div>
          <input type="submit" value={'Cadastrar'} className='btnSubmit' />
        </form>
      </div>
    </div>
  );
}

export default BoxCadastro;
