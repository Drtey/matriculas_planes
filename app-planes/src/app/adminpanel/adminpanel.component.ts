import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DbService } from '../services/db.service';
import axios from 'axios';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-adminpanel',
  templateUrl: './adminpanel.component.html',
  styleUrls: ['./adminpanel.component.scss']
})
export class AdminpanelComponent implements OnInit {

  constructor(private db:DbService, private cookie:CookieService) { }

  matriculas:any;
  

  async ngOnInit() {

    this.matriculas =  axios
    .get(`${this.db.url}/matriculas`)
    .then(response => {
      this.matriculas = response.data;
      console.log(this.matriculas);
      
    })
    .catch(error => {
      console.log(error);
    });    
    console.log(this.cookie.get('role'));
  }

 

  
  

}
