import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ActivationStart, Router } from '@angular/router';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  data;

  url = "http://localhost:1337";

  constructor(private cookie: CookieService, private jwtHelper: JwtHelperService, private router: Router) { }

  login(identifier, password) {
    axios
      .post(`${this.url}/auth/local`, {
        identifier: identifier,
        password: password,
      })
      .then(response => {
        // Handle success.
        console.log('Well done!');
        this.data = response.data.user;
        this.cookie.set('jwt', response.data.jwt, {expires: 30 / 1440});
        this.cookie.set('user', response.data, {expires: 30 / 1440});
        this.cookie.set('id', response.data.user.id, {expires: 30 / 1440})
        this.cookie.set('role', response.data.user.role.type, {expires: 30 / 1440})
        console.log(this.cookie.get('role'));
        this.router.navigate(['main/user']);
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
        const fp = document.getElementById('forgotten-password');
        fp.innerHTML = `
            <span style="color: #D83F3F">Credenciales incorrectas</span>
            <a href="https://google.es" style="color: #3195d1;
            font-weight: bold;">Recuperar contraseña</a>
        `
      });
  }

  register(email, username, password) {
    axios 
      .post(`${this.url}/auth/local/register`, {
        email: email,
        user: username,
        password: password,
      })
      .then(response => {
        console.log('Well done!');
        this.router.navigate(['signin']);
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
      });
  }

  emailValidation(identifier) {
    axios
    .post(`http://localhost:1337/auth/send-email-confirmation`, {
      email: identifier,
    })
    .then(response => {
      console.log('Your user received an email');
    })
    .catch(error => {
      console.error('An error occurred:', error.response);
    });
  }

  isAuth():boolean {
    const jwt = this.cookie.get('jwt');
    if(this.jwtHelper.isTokenExpired(jwt) || !this.cookie.get('jwt')) {
      return false;
    }
    return true;
  }

  logout(){
    this.cookie.deleteAll();
    this.router.navigate(['signin']);
  }

}
