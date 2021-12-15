import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
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
import { SigninComponent } from './signin/signin.component';
import { SignupComponent } from './signup/signup.component';

import { JwtHelperService, JWT_OPTIONS }  from '@auth0/angular-jwt';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { TokenInterceptorService } from './services/token-interceptor.service';

import { RolePanelGuard } from './guard/role-panel.guard';
import { AuthGuard } from './guard/auth.guard';
import { RoleGuard } from './guard/role.guard';
import { AutorizacionSalidaComponent } from './matricula/autorizacion-salida/autorizacion-salida.component';
import { MatriculaItemComponent } from './user/matricula-item/matricula-item.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ModalComponent } from './modal/modal.component';
import { AdminpanelComponent } from './adminpanel/adminpanel.component';
import { DataTablesModule } from 'angular-datatables';
import { SelectorMatriculaComponent } from './selector-matricula/selector-matricula.component';
import { RecoverPasswordComponent } from './signin/recover-password/recover-password.component';
import { MatriculafilledComponent } from './matriculafilled/matriculafilled.component';
import { Ng2SmartTableModule } from 'ng2-smart-table';


const rutas = [ 

  { path: 'signin', component: SigninComponent},
  { path: 'signup', component: SignupComponent},
  { path: 'recover-password', component: RecoverPasswordComponent},
  { path: '', redirectTo: '/signin', pathMatch:'full'},
  { path: 'main', component: MainComponent, canActivate:[RoleGuard, AuthGuard], data: { expectedRole: 'publico' }, 
      children: [
      { path: 'user', component: UserComponent },
      { path: 'selector-matricula', component: SelectorMatriculaComponent},
      { path: 'matricula/:id', component: MatriculaComponent},
      { path: '', component: MatriculaComponent},
      { path: 'adminpanel', component: AdminpanelComponent, canActivate: [RolePanelGuard], data: {adminRole: '3'}},
      { path: 'matriculafilled/:id', component: MatriculafilledComponent, canActivate: [RolePanelGuard], data: {adminRole: '3'}},
    ]
  },
  ];

@NgModule({
  declarations: [
    AppComponent,
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
    UserComponent,
    SigninComponent,
    SignupComponent,
    AutorizacionSalidaComponent,
    MatriculaItemComponent,
    ModalComponent,
    AdminpanelComponent,
    SelectorMatriculaComponent,
    RecoverPasswordComponent,
    MatriculafilledComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule.forRoot(rutas),
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    DataTablesModule,
    Ng2SmartTableModule
  ],
  providers: [
     // JWT
     { provide: JWT_OPTIONS, useValue: JWT_OPTIONS },
     JwtHelperService,
     // Token interceptor
     { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptorService, multi: true }
  ],
  bootstrap: [AppComponent],
  entryComponents: [ModalComponent]
})
export class AppModule { }
