import { Component, Input, OnInit } from '@angular/core';
import { degrees, PDFDocument, rgb, StandardFonts } from 'pdf-lib';
import axios from 'axios';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-matricula-item',
  templateUrl: './matricula-item.component.html',
  styleUrls: ['./matricula-item.component.scss']
})
export class MatriculaItemComponent implements OnInit {

  enviada = true;


  @Input() matriculaUser;

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
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
  
  abrirBorrarModal(id) {
    const modal = document.getElementById(`modal-matricula-borrar-${id}`)
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling');
  }

  cerrarBorrarModal(id) {
    const modal = document.getElementById(`modal-matricula-borrar-${id}`)
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling');
  }

  abrirEnviarModal(id) {
    const modal = document.getElementById(`modal-matricula-enviar-${id}`)
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling');
  }

  cerrarEnviarModal(id) {
    const modal = document.getElementById(`modal-matricula-enviar-${id}`)
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling');
  }

  enviarMatricula(id) {
    axios
      .put(`${this.authService.url}/matriculas/${id}`, {
        enviada: true
      })
      .then(response => {
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
    });

    this.cerrarEnviarModal(id);
    window.location.reload();
  }

  borrarMatricula(id) {
    axios
      .delete(`${this.authService.url}/matriculas/${id}`)
      .then(response => {
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
    });

    this.cerrarBorrarModal(id);
    window.location.reload();
  }

}
