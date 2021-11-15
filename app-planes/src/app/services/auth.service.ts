import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  readonly url = "http://localhost:1337";

  constructor(private http: HttpClient, private jwtHelper: JwtHelperService, public router: Router) { }

  singin(usuario:any) {
    return this.http.post(`${this.url}/auth/local`, usuario);
  }

  isAuth():boolean {
    const token = localStorage.getItem('token');
    if(this.jwtHelper.isTokenExpired(token) || !localStorage.getItem('token')) {
      return false;
    }
    return true;
  }

  logout(){
    localStorage.removeItem('token');
    this.router.navigate(['login']);
  }

}

