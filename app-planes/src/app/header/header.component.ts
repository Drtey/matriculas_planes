import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  rutaAdmin

  constructor(private authService: AuthService, private router: Router, private cookie:CookieService) {
    this.router.events.subscribe((ev) => {
      if (ev instanceof NavigationEnd) { 
        if(this.router.url == '/main/adminpanel'){
          this.rutaAdmin=false;
        }
      }
    });
  }

  ngOnInit(): void {
    const modal = document.getElementById('modal-logout');
    modal.style.display = "none";
    this.getRole();
  }

  abrirModal() {
    const modal = document.getElementById('modal-logout');
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling')
  }

  aceptarLogout() {
    const modal = document.getElementById('modal-logout');
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling')
    this.logout()
    /* this.router.navigateByUrl('/signin'); */
  }

  cancelarLogout() {
    const modal = document.getElementById('modal-logout');
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling')
  }
  getRole() {
    return this.cookie.get('role');
  }
  

  logout() {
    this.authService.logout();
  }

}
