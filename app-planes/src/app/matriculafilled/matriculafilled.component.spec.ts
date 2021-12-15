import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MatriculafilledComponent } from './matriculafilled.component';

describe('MatriculafilledComponent', () => {
  let component: MatriculafilledComponent;
  let fixture: ComponentFixture<MatriculafilledComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MatriculafilledComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MatriculafilledComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
