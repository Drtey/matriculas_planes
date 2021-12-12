import { Component, OnInit } from '@angular/core';
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

  curso;
  id = this.route.snapshot.paramMap.get('id');
  ngAfterViewInit() {
    
      
  console.log("ID: "+this.id);
      

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
  }

  
  

    getCurso() {
      axios
        .get(`${this.authService.url}/cursos`)
        .then(response => {
          this.curso = response.data;
          console.log(this.curso);
        })
        .catch(error => {
          console.log(error);
        })
    }

    getOptativas() {
      axios
        .get(`${this.authService.url}/optativas?modalidades=${this.id}`)
        .then(response => {
          this.curso = response.data;
          console.log(this.curso);
        })
        .catch(error => {
          console.log(error);
        })
    }

  
  
}
