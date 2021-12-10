import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-datos-academicos',
  templateUrl: './datos-academicos.component.html',
  styleUrls: ['./datos-academicos.component.scss']
})
export class DatosAcademicosComponent implements OnInit {


materiasOptativas = [
  'materia1',
  'materia2',
  'materia3',
  'materia4',
  'materia5',
  'materia6',
  'materia7',
  'materia8',
]

materiasCursa = [
  'materia1',
  'materia2',
  'materia3',
  'materia4',
  'materia5',
  'materia6',
  'materia7',
]

matematicasOpciones



// almacenar listitems
listItems = [];

dragStartIndex

  constructor() { }

  ngOnInit(): void {
   /*  let draggable_list = document.getElementById('draggable-list');
    this.createList()
    this.listItems.forEach(element => {
      console.log(element)
      console.log(draggable_list)
      draggable_list.append(element); 
    })*/
  }

  /* createList() {
    [...this.materiasOptativas]
      .map(a => ({ value: a, sort: Math.random() }))
      .sort((a, b) => a.sort - b.sort)
      .map(a => a.value)
      .forEach((materia, index:any) => {

        const listItem = document.createElement('LI');
        
        listItem.setAttribute('data-index', index);

        listItem.innerHTML = `
          <input type="number" class="order-input"/>
          <div class="draggable" draggable="true">
            <p class="nombre-materia">${materia}</p>
          </div>
        `;

        this.listItems.push(listItem)
      })
  } */
  
}

