import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { AuthService } from '../services/auth.service';
import axios from 'axios';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {

  matriculaUser;

  constructor(private authService: AuthService) { 

  }

  ngAfterViewInit() {
    const darkMode = <HTMLInputElement> document.getElementById('dark-mode');
    const bloques = document.querySelectorAll('.bloque');
    bloques.forEach(element => {
      element.classList.remove('dark');
    });
    
    if (darkMode.checked) {
      document.body.classList.add('dark');
      bloques.forEach(element => {
        element.classList.add('dark');
        console.log('bloque')
      });
    }
  }

  ngOnInit(): void {
    const modal = document.getElementById('modal-usuario');
    modal.style.display = "none";

    const editarBoton = document.getElementById('editarUser');
    const guardarBoton = document.getElementById('guardarUser');
    let campos = document.querySelectorAll('.usuario');

    editarBoton.addEventListener("click", () => {
      campos.forEach(element => {
        element.removeAttribute('disabled');
      });
      guardarBoton.classList.remove('apagado');
      editarBoton.classList.add('apagado');
    });
    guardarBoton.addEventListener("click", () => {
      campos.forEach(element => {
        element.setAttribute('disabled', "");
      });
      editarBoton.classList.remove('apagado');
      guardarBoton.classList.add('apagado');
    });
  }

  abrirModal() {
    const modal = document.getElementById('modal-usuario');
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling')
  }

  cerrarModal() {
    const modal = document.getElementById('modal-usuario');
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling')
  }

  getMatricula() {
    console.log(this.authService.data.id);
    axios
      .get(`${this.authService.url}/matriculas?user=${this.authService.data.id}`)
      .then(response => {
        this.matriculaUser = response.data;
        console.log(this.matriculaUser);
      })
      .catch(error => {
        console.log(error);
      })
  }
}







