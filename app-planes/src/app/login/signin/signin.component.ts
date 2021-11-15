import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';


@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.scss']
})
export class SigninComponent implements OnInit {

  usuario = {
    usuario: '',
    passwd: ''
  }

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
  }
  logIn(){
    console.log(this.usuario);
    this.authService.singin(this.usuario).subscribe( (res:any) => {
      console.log(res);
      localStorage.setItem('token',res.token);
      this.router.navigate(['main']);
    })
  }

}