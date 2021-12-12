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
}
