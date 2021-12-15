import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { DbService } from '../services/db.service';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';
    
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { right } from '@popperjs/core';

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
  selectedOption;
  selectedOption2;

  @ViewChild(DataTableDirective)
  dtElement: DataTableDirective;
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();

  settings = {
    actions:{
      position:'right',
      edit:false,
      add:false,
      delete:false,
      custom:[
        {
          name:'view',
          title:'<i class="fa fa-eye"></i>'
        },
      ],
      columnTitle:'Acciones',
    },    
    columns: {      
      id: {
        title: 'Nº Matrícula',
        filter: false,
      },
      nombre: {
        title: 'Nombre',
        filter: false,
      },
      papellido: {
        title: '1º Apellido',
        filter: false,
      },
      sapellido:{
        title:'2º Apellido',
        filter: false,
      },
      NIF:{
        title:'NIF/NIE',
        filter: false,
      },
      tel:{
        title:'Teléfono',
        filter: false,
      },
      nSSocial:{
        title:'Nº Seguridad Social',
        filter:false,
      },       
      enviada:{
        title:'Enviada',
        filter: false,
      }
      
    },
    pager: {
      display: true,
      perPage: 10,
    },
    
  };

  ngOnInit(): void {    
    this.toDo();
    axios
      .get(`${this.db.url}/matriculas`)
      .then((response) => {
        this.matriculas = response.data;       
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
      pageLength: 10,
      language: {
        emptyTable: 'No hay información',
        info: 'Mostrando _START_ a _END_ de _TOTAL_ Matrículas',
        infoEmpty: 'Mostrando 0 to 0 of 0 Matrículas',
        infoFiltered: '(Filtrado de _MAX_ total matrículas)',
        infoPostFix: '',
        thousands: ',',
        lengthMenu: '_MENU_ Mostrar Matrículas ',
        loadingRecords: 'Cargando...',
        processing: 'Procesando...',
        search: 'Buscar:',
        zeroRecords: 'Sin resultados encontrados',
        paginate: {
          first: 'Primero',
          last: 'Último',
          next: 'Siguiente',
          previous: 'Anterior',
        },
      },
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

  getModalidadesByCurso() {
    axios
      .get(`${this.db.url}/modalidades?curso=${this.selectedOption}`)
      .then((response) => {
        this.modalidades = response.data;
        console.log(this.modalidades);
        this.rerender();
      })
      .catch((error) => {
        console.log(error);
      });

    axios
      .get(`${this.db.url}/matriculas?curso=${this.selectedOption}`)
      .then((response) => {
        this.matriculas = response.data;
        console.log(this.matriculas);
        this.rerender();
      })
      .catch((error) => {
        console.log(error);
      });
  }
  filtrarMatriculas() {
    axios
      .get(
        `${this.db.url}/matriculas?curso=${this.selectedOption}&modalidad=${this.selectedOption2}`
      )
      .then((response) => {
        this.matriculas = response.data;
        console.log(this.matriculas);
        this.rerender();
      })
      .catch((error) => {
        console.log(error);
      });

    console.log(this.matriculas);
  }

  resetFilters() {
    this.selectedOption = '0';
    this.selectedOption2 = '0';
    axios
      .get(`${this.db.url}/matriculas`)
      .then((response) => {
        this.matriculas = response.data;
        console.log(this.matriculas);
      })
      .catch((error) => {
        console.log(error);
      });
  }
}
