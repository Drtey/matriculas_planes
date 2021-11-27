import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dark-mode',
  templateUrl: './dark-mode.component.html',
  styleUrls: ['./dark-mode.component.scss']
})
export class DarkModeComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {

    const darkMode = document.getElementById('dark-mode');
    const bloques = document.querySelectorAll('.bloque');
    console.log(bloques);

    darkMode.addEventListener('change', () => {
      document.body.classList.toggle('dark');
      bloques.forEach(element => {
        element.classList.toggle('dark');
      });
    })

  }

}
