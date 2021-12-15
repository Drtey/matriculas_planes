import { TestBed } from '@angular/core/testing';

import { RolePanelGuard } from './role-panel.guard';

describe('RolePanelGuard', () => {
  let guard: RolePanelGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(RolePanelGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
