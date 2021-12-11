import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

import decode from 'jwt-decode';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})

export class RoleGuard implements CanActivate {
  

  constructor(
    private cookie: CookieService,
    private authService: AuthService,
    public router: Router
  ){ }
  canActivate(route: ActivatedRouteSnapshot):boolean{

    const expectedRole = route.data.expectedRole;
    const jwt = this.cookie.get('jwt');
    console.log(jwt);
    
    if (this.cookie.get('role') === expectedRole) {
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