import { Component, Input, OnInit } from '@angular/core';
import { interval } from 'rxjs';

@Component({
  selector: 'app-matricula-item',
  templateUrl: './matricula-item.component.html',
  styleUrls: ['./matricula-item.component.scss']
})
export class MatriculaItemComponent implements OnInit {

  enviada = true

  @Input() matricula

  constructor() { }

  ngOnInit(): void {
/*     console.log(this.matricula)
    console.log(this.matricula.id) */
    

  }

  openModal() {
    
  }

}
