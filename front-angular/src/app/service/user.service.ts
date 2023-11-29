import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Users } from '../models/users.model';

const baseUrl = 'http://localhost:3000/';

@Injectable({
  providedIn: 'root'
})
export class TutorialService {

  constructor(private http:HttpClient) { }

  getAll():Observable<Users[]>{
    return this.http.get<Users[]>(baseUrl);
  }
}
