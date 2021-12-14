import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dark-mode',
  templateUrl: './dark-mode.component.html',
  styleUrls: ['./dark-mode.component.scss']
})
export class DarkModeComponent implements OnInit {

  

  constructor() {
  }

  ngOnInit(): void {

    const darkMode = <HTMLInputElement> document.getElementById('dark-mode');

    darkMode.removeEventListener;
    darkMode.addEventListener('change', () => {
      if(darkMode.checked) {
        let bloques = document.querySelectorAll('.bloque');
        let modal = document.querySelectorAll('.modal-planes');
        document.body.classList.add('dark');
        bloques.forEach(element => {
          element.classList.add('dark');
        });
        modal.forEach(element => {
          element.classList.add('dark');
        });
      } else {
        let bloques = document.querySelectorAll('.bloque');
        let modal = document.querySelectorAll('.modal-planes');
        document.body.classList.remove('dark');
         bloques.forEach(e => {
          e.classList.remove('dark');
        }); 
        modal.forEach(element => {
          element.classList.remove('dark');
        });
/*         while(bloques.length) {
          bloques[0].classList.remove("dark");
        } */
      }

    })

  }

}
