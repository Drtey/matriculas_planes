/* import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';


@Injectable({
  providedIn: 'root'
})
export class RoleGuard implements CanActivate {
  

  constructor(
    private authService: AuthService,
    public router: Router
  ){ }
  canActivate(route: ActivatedRouteSnapshot):boolean{

    const expectedRole = route.data.expectedRole;
    const token = localStorage.getItem('token');
    
    const data = this.decode(token);
    
    console.log(data.role)
    if (data.role === expectedRole) {
      if( !this.authService.isAuth()) {
        this.router.navigate(['login']);
        return false;
      }
      return true;
      }
      else{
        console.log('Usuario no autorizado para esta sección');
        return false;
      }
    }
    */
  /* decode(token) {
    try {
      
      const base64HeaderUrl = token.split('.')[0];
      const base64Header = base64HeaderUrl.replace('-', '+').replace('_', '/');
      const headerData = JSON.parse(window.atob(base64Header));
  
      
      const base64Url = token.split('.')[1];
      const base64 = base64Url.replace('-', '+').replace('_', '/');
      const dataJWT = JSON.parse(window.atob(base64));
      dataJWT.header = headerData;
  
  
      return dataJWT;
    } catch (err) {
      return false;
    }
  }
  
  
} */
