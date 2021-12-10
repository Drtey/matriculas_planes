import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    const modal = document.getElementById('modal-logout');
    modal.style.display = "none";
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
  

  logout() {
    this.authService.logout();
  }

}
