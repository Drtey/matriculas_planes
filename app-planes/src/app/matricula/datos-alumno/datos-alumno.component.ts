import { Component, OnInit } from '@angular/core';
import { Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-datos-alumno',
  templateUrl: './datos-alumno.component.html',
  styleUrls: ['./datos-alumno.component.scss']
})
export class DatosAlumnoComponent implements OnInit {

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

  constructor() {
   }

  ngOnInit(): void {

  }

}
