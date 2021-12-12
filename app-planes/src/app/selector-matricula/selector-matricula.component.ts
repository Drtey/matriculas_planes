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

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
    this.getCursos();
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
}