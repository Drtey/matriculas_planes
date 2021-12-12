import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { DbService } from '../services/db.service';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';

@Component({
  selector: 'app-adminpanel',
  templateUrl: './adminpanel.component.html',
  styleUrls: ['./adminpanel.component.scss'],
})
export class AdminpanelComponent implements OnInit {
  constructor(private db: DbService, private cookie: CookieService) {}

  matriculas;
  cursos;
  modal;
  modalidades;

  @ViewChild(DataTableDirective)
  dtElement: DataTableDirective;
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();

  ngOnInit(): void {
    this.toDo();

    axios
      .get(`${this.db.url}/matriculas`)
      .then((response) => {
        this.matriculas = response.data;
        console.log(this.matriculas);
        this.rerender();
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`${this.db.url}/cursos`)
      .then((response) => {        
        this.cursos = response.data.map((curso) => {
          return {
            id: curso.id,
            nombre: curso.nombre,
            modalidades: curso.modalidades,
          };
        });
        this.modalidades = this.cursos[0].modalidades.map((modalidad) => {
          return {
            id: modalidad.id,
            nombre: modalidad.nombre,
            };
        
        });
       
        console.log(this.modalidades);
      })
      .catch((error) => {
        console.log(error);
      });
  }
  ngAfterViewInit(): void {
    this.dtTrigger.next();
  }

  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();
  }

  toDo() {
    this.dtOptions = {
      ajax: this.matriculas,
      pagingType: 'full_numbers',
      pageLength: 2,
    };
  }
  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      // Destroy the table first
      dtInstance.destroy();
      // Call the dtTrigger to rerender again
      this.dtTrigger.next();
    });
  }

  getMatriculasByCurso(id) {
    axios
      .get(`${this.db.url}/matriculas?curso=${id}`)
      .then((response) => {
        this.matriculas = response.data;
        console.log(this.matriculas);
        this.rerender();
      })
      .catch((error) => {
        console.log(error);
      });
  }

  setModalidad(id) {
    
    this.modal = id;
    console.log(this.modal);
  }
}
