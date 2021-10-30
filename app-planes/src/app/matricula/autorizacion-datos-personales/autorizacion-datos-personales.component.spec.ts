import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AutorizacionDatosPersonalesComponent } from './autorizacion-datos-personales.component';

describe('AutorizacionDatosPersonalesComponent', () => {
  let component: AutorizacionDatosPersonalesComponent;
  let fixture: ComponentFixture<AutorizacionDatosPersonalesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AutorizacionDatosPersonalesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AutorizacionDatosPersonalesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
