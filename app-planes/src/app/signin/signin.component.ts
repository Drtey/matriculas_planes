import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';



@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.scss'],
})
export class SigninComponent implements OnInit {

  matriculaciones=true;

  usuario = {
    identifier: "",
    password: ""
  }

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
    
  }

  logIn(){
    this.authService.login(this.usuario.identifier, this.usuario.password);
  }

  togglePassword() {
    const togglePassword = document.getElementById('toggleSigninPassword')
    const password = document.getElementById('signinPassword');
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    
    if (password.getAttribute('type') == 'text') {
        togglePassword.classList.remove('fa-eye')
        togglePassword.classList.add('fa-eye-slash')
    }
    if (password.getAttribute('type') == 'password') {
      togglePassword.classList.remove('fa-eye-slash')
        togglePassword.classList.add('fa-eye')
    }
  }

}
