import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectorMatriculaComponent } from './selector-matricula.component';

describe('SelectorMatriculaComponent', () => {
  let component: SelectorMatriculaComponent;
  let fixture: ComponentFixture<SelectorMatriculaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SelectorMatriculaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SelectorMatriculaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
