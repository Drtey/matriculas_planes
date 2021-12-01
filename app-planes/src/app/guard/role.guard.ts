import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

import decode from 'jwt-decode';

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
    const jwt = localStorage.getItem('jwt');
    console.log(jwt);
    console.log(this.authService.data);
    console.log(this.authService.data.role.type);
    
    if (this.authService.data.role.type === expectedRole) {
      if( !this.authService.isAuth()) {
        this.router.navigate(['signin']);
        return false;
      }
      return true;
      }
      else{
        console.log('Usuario no autorizado para esta sección');
        return false;
      }
    }
   
  
  
}