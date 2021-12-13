import { Component, OnInit, Input} from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { ActivatedRoute, ParamMap } from '@angular/router';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from '../services/auth.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-matricula',
  templateUrl: './matricula.component.html',
  styleUrls: ['./matricula.component.scss']
})

export class MatriculaComponent implements OnInit {
  

  constructor(private route: ActivatedRoute,private router: Router, private authService: AuthService, private cookie: CookieService) {}

  optativas;
  curso;
  troncales;
  modalidad;
  id = this.route.snapshot.paramMap.get('id');
  user;

  alumno = {
    papellido: "",
    sapellido: "",
    nombre: "",
    nif: "",
    direccion: "",
    localidad: "",
    provincia: "",
    cp: null,
    telef: null,
    fechaNac: "",
    lugarNac: "",
    provinciaNac: "",
    email: "",
    nuss: null,
  }

  familiar = {
    apellido1Tutor1: "",
    apellido2Tutor1: "",
    nombreTutor1: "",
    emailTutor1: "",
    nifTutor1: "",
    telefTutor1: null,
    apellido1Tutor2: "",
    apellido2Tutor2: "",
    nombreTutor2: "",
    emailTutor2: "",
    nifTutor2: "",
    telefTutor2: null,
    faltasTutor: null,
  }

  academicos = {
    centro: "",
    repite: false,
    valoresTutor1: false,
    valoresTutor2: false,
    ordenOptativas: [],
  }

  imagen = {
    autorizo: false,
  }

  enfermedades = {
    enfermedad: false,
  }

  salida = {
    tutor1: null,
    tutor2: null
  }

  datosPersonales = {
    autorizo: false
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
    this.getModalidad();
    this.getUser();
   
  }

  getModalidad() {
    axios
      .get(`${this.authService.url}/modalidades/${this.id}`)
      .then(response => {
        this.modalidad = response.data;
        console.log(this.modalidad);
        this.curso = response.data.curso;
        console.log(this.curso.id);
        this.troncales = response.data.troncales;
        this.optativas = response.data.optativas;
      })
      .catch(error => {
        console.log(error);
      })
  }

  getUser() {
    const id = this.cookie.get('id');
    axios
      .get(`${this.authService.url}/users/${id}`)
      .then(response => {
        this.user = response.data;
        console.log(this.user);
      })
      .catch(error => {
        console.log(error);
      })
  }

  crearMatricula(){
    const modal = document.getElementById('modal-matricula');
    axios
      .post(`${this.authService.url}/matriculas`, {
        user: this.user.id,
        curso: this.curso.nombre,
        modalidad: this.modalidad.nombre,
        nombre: this.alumno.nombre,
        papellido: this.alumno.papellido,
        sapellido: this.alumno.sapellido,
        NIF: this.alumno.nif,
        direccion: this.alumno.direccion,
        localidad: this.alumno.localidad,
        lugarNacimiento: this.alumno.lugarNac,
        provinciaNacimiento: this.alumno.provinciaNac,
        provincia: this.alumno.provincia,
        tel: this.alumno.telef,
        codigoPostal: this.alumno.cp,
        fechaNac: this.alumno.fechaNac,
        nSSocial: this.alumno.nuss,
        nombreTutor1: this.familiar.nombreTutor1,
        papellidoTutor1: this.familiar.apellido1Tutor1,
        sapellidoTutor1: this.familiar.apellido2Tutor1,
        emailTutor1: this.familiar.emailTutor1,
        nifTutor1: this.familiar.nifTutor1,
        telTutor1: this.familiar.telefTutor1,
        nombreTutor2: this.familiar.nombreTutor2,
        papellidoTutor2: this.familiar.apellido1Tutor2,
        sapellidoTutor2: this.familiar.apellido2Tutor2,
        emailTutor2: this.familiar.emailTutor2,
        nifTutor2: this.familiar.nifTutor2,
        telTutor2: this.familiar.telefTutor2,
        faltasTutor: this.familiar.faltasTutor, //cambio
        imagenPermisos: this.imagen.autorizo,
        enfermedades: this.enfermedades.enfermedad,
        salidaTutor1: this.salida.tutor1,
        salidaTutor2: this.salida.tutor2,
        datosPersonales: true,
        centroProcedencia: this.academicos.centro,
        repite: this.academicos.repite,
        valores: "string",
        valoresTutor1: this.academicos.valoresTutor1,
        valoresTutor2: this.academicos.valoresTutor2,
        ordenOptativas: "string",
      })
      .then(response => {
        // Handle success.
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);

      });
  }  

  
  abrirModal() {
    const modal = document.getElementById('modal-matricula');
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling')
  }

  cancelarModal() {
    const modal = document.getElementById('modal-matricula');
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling')
  }


}
