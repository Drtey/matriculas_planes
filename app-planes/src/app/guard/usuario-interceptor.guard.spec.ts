import { TestBed } from '@angular/core/testing';

import { UsuarioInterceptorGuard } from './usuario-interceptor.guard';

describe('UsuarioInterceptorGuard', () => {
  let guard: UsuarioInterceptorGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(UsuarioInterceptorGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
