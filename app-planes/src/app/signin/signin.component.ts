import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';



@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.scss'],
})
export class SigninComponent implements OnInit {

  usuario = {
    identifier: "",
    password: ""
  }

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
  }

  logIn(){
    console.log(this.usuario);
    this.authService.singin(this.usuario).subscribe( (res:any) => {
      console.log(res);
      localStorage.setItem('jwt',res.jwt);
      this.router.navigate(['main']);
    })
  }

}
