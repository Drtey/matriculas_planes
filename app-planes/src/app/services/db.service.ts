import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import axios, { Axios } from 'axios';




@Injectable({
  providedIn: 'root',
})
export class DbService {
  url = "http://localhost:1337";

  constructor(private http: HttpClient) {}

  
  

  getData() {
    return this.http.get(this.url);
  }
  getDataByUsername(username) {
    return this.http.get(`${this.url}?username=${username}`);
  }
  getDataById(id) {
    return this.http.get(`${this.url}/${id}`);
  }

  postData(data) {
    return this.http.post(this.url, data);
  }

  putData(id, data) {
    return this.http.put(`${this.url}/${id}`, data);
  }

  deleteData(id) {
    return this.http.delete(`${this.url}/${id}`);
  }

  getDataByName(name) {
    return this.http.get(`${this.url}?username=${name}`);
  }

  getDataByEmail(email) {
    return this.http.get(`${this.url}?email=${email}`);
  }

  getDataByPhone(phone) {
    return this.http.get(`${this.url}?phone=${phone}`);
  }

  getDataByWebsite(website) {
    return this.http.get(`${this.url}?website=${website}`);
  }

  getDataByDni(dni) {
    return this.http.get(`${this.url}?dni=${dni}`);
  }

  getDataByAddress(address) {
    return this.http.get(`${this.url}?address=${address}`);
  }
  


}
