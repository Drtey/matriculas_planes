import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {

  constructor() { 

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

  quitarFocus() {
    const select = document.getElementById('elegir-curso');
    select.blur();
  }

}


