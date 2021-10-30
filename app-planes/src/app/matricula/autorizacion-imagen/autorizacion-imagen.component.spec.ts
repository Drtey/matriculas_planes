import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AutorizacionImagenComponent } from './autorizacion-imagen.component';

describe('AutorizacionImagenComponent', () => {
  let component: AutorizacionImagenComponent;
  let fixture: ComponentFixture<AutorizacionImagenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AutorizacionImagenComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AutorizacionImagenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
