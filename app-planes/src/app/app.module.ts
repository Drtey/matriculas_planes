import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { DarkModeComponent } from './header/dark-mode/dark-mode.component';
import { MatriculaComponent } from './matricula/matricula.component';
import { DatosAlumnoComponent } from './matricula/datos-alumno/datos-alumno.component';
import { DatosFamiliaresComponent } from './matricula/datos-familiares/datos-familiares.component';
import { DatosAcademicosComponent } from './matricula/datos-academicos/datos-academicos.component';
import { AutorizacionImagenComponent } from './matricula/autorizacion-imagen/autorizacion-imagen.component';
import { EnfermedadesComponent } from './matricula/enfermedades/enfermedades.component';
import { AutorizacionDatosPersonalesComponent } from './matricula/autorizacion-datos-personales/autorizacion-datos-personales.component';
import { MainComponent } from './main/main.component';
import { UserComponent } from './user/user.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    HeaderComponent,
    FooterComponent,
    DarkModeComponent,
    MatriculaComponent,
    DatosAlumnoComponent,
    DatosFamiliaresComponent,
    DatosAcademicosComponent,
    AutorizacionImagenComponent,
    EnfermedadesComponent,
    AutorizacionDatosPersonalesComponent,
    MainComponent,
    UserComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
