import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private url = "http://localhost:1337";

  constructor(private http: HttpClient, private jwtHelper: JwtHelperService, private router: Router) { }

  singin(usuario:any) {
    console.log(usuario);
    return this.http.post(`${this.url}/auth/local`, usuario);
  }

  isAuth():boolean {
    const jwt = localStorage.getItem('jwt');
    if(this.jwtHelper.isTokenExpired(jwt) || !localStorage.getItem('jwt')) {
      return false;
    }
    return true;
  }

  logout(){
    localStorage.removeItem('jwt');
    this.router.navigate(['signin']);
  }

}
