import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'app-matricula',
  templateUrl: './matricula.component.html',
  styleUrls: ['./matricula.component.scss']
})

export class MatriculaComponent implements OnInit {

  constructor() { 

  }
  ngAfterViewInit() {
     const darkMode = <HTMLInputElement> document.getElementById('dark-mode');
        const bloques = document.querySelectorAll('.bloque');
        bloques.forEach(element => {
          element.classList.remove('dark');
        });
        
        if (darkMode.checked) {
          document.body.classList.add('dark');
          bloques.forEach(element => {
            element.classList.add('dark');
          });
        }
  }

  ngOnInit(): void {
/*     window.addEventListener('beforeunload', (event) => {
      event.returnValue = `Are you sure you want to leave?`;
    }); */
  }

}
