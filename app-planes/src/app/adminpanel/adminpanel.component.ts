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
    console.log(this.cookie.get('role'));
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
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Matrículas",
        "infoEmpty": "Mostrando 0 to 0 of 0 Matrículas",
        "infoFiltered": "(Filtrado de _MAX_ total matrículas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "_MENU_ Mostrar Matrículas ",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Último",
            "next": "Siguiente",
            "previous": "Anterior"
        }
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
}
