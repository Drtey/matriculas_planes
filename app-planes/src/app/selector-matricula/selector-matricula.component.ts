import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';
import axios from 'axios';

@Component({
  selector: 'app-selector-matricula',
  templateUrl: './selector-matricula.component.html',
  styleUrls: ['./selector-matricula.component.scss']
})
export class SelectorMatriculaComponent implements OnInit {

  cursos;
  modalidades;

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
    this.getCursos();
    document.getElementById('elegir-modalidades').style.display = "none";
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
    document.querySelector('.adminpanel').classList.remove('dark');
    
    if (darkMode.checked) {
      document.body.classList.add('dark');
      document.querySelector('.adminpanel').classList.add('dark');
      bloques.forEach(element => {
        element.classList.add('dark');
      });
      modal.forEach(element => { 
        element.classList.add('dark');
      });
    }
}

  getCursos() {
    axios
      .get(`${this.authService.url}/cursos`)
      .then(response => {
        this.cursos = response.data;
      })
      .catch(error => {
        console.log(error);
      })
  }
  elegirModalidad(id) {
    this.getModalidades(id);
    document.getElementById('elegir-cursos').style.display = "none";
    document.getElementById('elegir-modalidades').style.display = "block";
  }

  getModalidades(idCurso) {
    axios
      .get(`${this.authService.url}/modalidades?curso=${idCurso}`)
      .then(response => {
        this.modalidades = response.data;
      })
      .catch(error => {
        console.log(error);
      })
  }

  togglemodalidades() {
    document.getElementById('elegir-modalidades').style.display = "none";
    document.getElementById('elegir-cursos').style.display = "block";
  }

  
}
