import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})
export class RolePanelGuard implements CanActivate {
  constructor(
    private cookie: CookieService,
    public router: Router
  ){ }
  canActivate(route: ActivatedRouteSnapshot):boolean{

    const adminRole = route.data.adminRole;
    const jwt = this.cookie.get('jwt');
    console.log(jwt);
    
    if (this.cookie.get('roleid') === adminRole) {
      return true;
      }
      else{
        console.log('Usuario no autorizado para esta sección');
        return false;
      }
    }
   
  
  
}
