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

  dark = true;

  constructor(private authService: AuthService, private router: Router, private cookie:CookieService) {
    
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
    return this.cookie.get('roleid');
  }
  

  logout() {
    this.authService.logout();
  }

  setDark(bool) {
    this.dark = bool;
  }

}
