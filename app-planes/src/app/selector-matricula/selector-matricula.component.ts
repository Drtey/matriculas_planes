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

  getCursos() {
    axios
      .get(`${this.authService.url}/cursos`)
      .then(response => {
        this.cursos = response.data;
        console.log(this.cursos);
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
        console.log(this.modalidades);
      })
      .catch(error => {
        console.log(error);
      })
  }

  
}
