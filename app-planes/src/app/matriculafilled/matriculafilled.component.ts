import { Component, OnInit, Input } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { ActivatedRoute, ParamMap } from '@angular/router';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';
import { DbService } from '../services/db.service';

@Component({
  selector: 'app-matriculafilled',
  templateUrl: './matriculafilled.component.html',
  styleUrls: ['./matriculafilled.component.scss'],
})
export class MatriculafilledComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authService: AuthService,
    private cookie: CookieService,
    private db: DbService,
  ) {}

  optativas;
  curso;
  troncales;
  modalidad;
  id; 
  user;
  religion = [];

  matricula=[];


  ngOnInit(): void {

    this.id = this.route.snapshot.paramMap.get('id');

    axios
      .get(`${this.db.url}/matriculas?id=${this.id}`)
      .then((response) => {
        this.matricula = response.data;      
        console.log(this.matricula[0].papellido)
      })
      .catch((error) => {
        console.log(error);
      });
      
    this.getModalidad();
    this.getUser();
  }

  getUser() {
    const id = this.cookie.get('id');
    axios
      .get(`${this.authService.url}/users/${id}`)
      .then((response) => {
        this.user = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  }
  getModalidad() {
    axios
      .get(`${this.authService.url}/modalidades/${this.id}`)
      .then((response) => {
        this.modalidad = response.data;
        this.curso = response.data.curso;
        this.troncales = response.data.troncales;
        this.optativas = response.data.optativas;
        this.religion = response.data.optativas[0].Religion;
      })
      .catch((error) => {
        console.log(error);
      });
  }

  ngAfterViewInit() {
    console.log(this.matricula)
    const darkMode = <HTMLInputElement>document.getElementById('dark-mode');
    const bloques = document.querySelectorAll('.bloque');
    const modal = document.querySelectorAll('.modal-planes');
    bloques.forEach((element) => {
      element.classList.remove('dark');
    });
    modal.forEach((element) => {
      element.classList.remove('dark');
    });
    document.querySelector('.adminpanel').classList.remove('dark');

    if (darkMode.checked) {
      document.body.classList.add('dark');
      document.querySelector('.adminpanel').classList.add('dark');
      bloques.forEach((element) => {
        element.classList.add('dark');
      });
      modal.forEach((element) => {
        element.classList.add('dark');
      });
    }

   
    
  }
}
