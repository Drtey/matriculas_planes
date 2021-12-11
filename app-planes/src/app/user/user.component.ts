import { Component, Input, OnInit } from '@angular/core';
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

  response;

  constructor(private authService: AuthService) { 

  }

  ngAfterViewInit() {
    const darkMode = <HTMLInputElement> document.getElementById('dark-mode');
    const bloques = document.querySelectorAll('.bloque');
    const modal = document.querySelectorAll('.modal-planes');
    bloques.forEach(element => {
      element.classList.remove('dark');
    });
    modal.forEach(element => {
      element.classList.remove('dark');
    });
    
    if (darkMode.checked) {
      document.body.classList.add('dark');
      bloques.forEach(element => {
        element.classList.add('dark');
      });
      modal.forEach(element => {
        element.classList.add('dark');
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


    this.getMatricula();
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


  async getMatricula() {
    /* console.log(this.authService.data.id); */
    axios
      .get(`${this.authService.url}/matriculas?user=${this.authService.data.id}`)
      .then(response => {
        response
        console.log(response)
        this.matriculaUser = response;
        /* console.log(this.matriculaUser); */
      })
      .catch(error => {
        console.log(error);
      })
  }

  quitarFocus() {
    const select = document.getElementById('elegir-curso');
    select.blur();
  }


}







