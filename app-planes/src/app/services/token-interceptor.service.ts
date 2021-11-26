import { Injectable } from '@angular/core';
import { HttpInterceptor } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class TokenInterceptorService {

  intercept(req, next) {
    const jwt = localStorage.getItem('jwt');
    const tokenHeader = req.clone({
      setHeaders: {
        Authorization: `Bearer ${jwt}`
      }
    });
    return next.handle(tokenHeader);
  }

  constructor() { }
}
