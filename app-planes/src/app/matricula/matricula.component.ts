import { Component, OnInit, Input} from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { ActivatedRoute, ParamMap } from '@angular/router';
import axios from 'axios';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-matricula',
  templateUrl: './matricula.component.html',
  styleUrls: ['./matricula.component.scss']
})

export class MatriculaComponent implements OnInit {
  

  constructor(private route: ActivatedRoute,private router: Router, private authService: AuthService) {}

  optativas;
  troncales;
  curso;
  id = this.route.snapshot.paramMap.get('id');

  alumno = {
    papellido: "",
    sapellido: "",
    nombre: "",
    nif: "",
    direccion: "",
    localidad: "",
    provincia: "",
    cp: "",
    telef: "",
    fechaNac: "",
    lugarNac: "",
    provinciaNac: "",
    email: "",
    nuss: "",
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

  ngOnInit(): void {
/*     window.addEventListener('beforeunload', (event) => {
      event.returnValue = `Are you sure you want to leave?`;
    }); */
    this.getCurso();
  }

  getCurso() {
    axios
      .get(`${this.authService.url}/modalidades/${this.id}`)
      .then(response => {
        this.curso = response.data;
        this.troncales = response.data.troncales;
        this.optativas = response.data.optativas;
      })
      .catch(error => {
        console.log(error);
      })
  }

  crearMatricula(){
    axios
      .post(`${this.authService.url}/matriculas`)
      .then(response => {
        // Handle success.
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
      });
  }  
}
