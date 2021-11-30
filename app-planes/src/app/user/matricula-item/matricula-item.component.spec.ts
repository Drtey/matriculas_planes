import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MatriculaItemComponent } from './matricula-item.component';

describe('MatriculaItemComponent', () => {
  let component: MatriculaItemComponent;
  let fixture: ComponentFixture<MatriculaItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MatriculaItemComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MatriculaItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
