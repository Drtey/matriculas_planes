import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {

  usuario = {
    email: "",
    username: "",
    password: "",
    password2: ""
  }

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
  }

  register() {
    if(this.usuario.password == this.usuario.password2) {
      this.authService.register(this.usuario.email, this.usuario.username, this.usuario.password2);
/*       this.authService.emailValidation(this.usuario.identifier);
 */    }
    else {
      console.log("Password doesn´t match.")
      const fp = document.getElementById('failed-signup');
        fp.innerHTML = `
            <span style="color: #D83F3F">Las contraseñas no coinciden</span>
        `
    }
  }

  togglePassword() {
    const togglePassword = document.getElementById('toggleSignupPassword')
    const password = document.getElementById('signupPassword');
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
  togglePassword2() {
    const togglePassword = document.getElementById('toggleSignupPassword2')
    const password = document.getElementById('signupPassword2');
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
