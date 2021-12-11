import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-matricula-item',
  templateUrl: './matricula-item.component.html',
  styleUrls: ['./matricula-item.component.scss']
})
export class MatriculaItemComponent implements OnInit {

  enviada = true
  @Input() matriculaUser;

  constructor() { }

  ngOnInit(): void {
  }

  openModal() {
    
  }

}
