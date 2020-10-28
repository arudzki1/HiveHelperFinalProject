import { Injectable, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ApiResult } from '../models/api-result';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class UserDataService {
  userUrl: string = 'api/users';
  loggedIn: ApiResult;

  constructor(@Inject('BASE_URL') private baseUrl: string, private http: HttpClient) {
    this.loggedIn = {};
  }

  //login
  login(username: string, password: string): Observable<ApiResult> {
    console.log(this.baseUrl + this.userUrl + `/${username}/${password}`);
    return this.http.get<ApiResult>(this.baseUrl + this.userUrl + `/${username}/${password}`);
  }

  //adduser
  addUser(user: User): Observable<ApiResult> {
    return this.http.post(this.baseUrl + this.userUrl, user);
  }

  //update-password
  updatePassword(oldPassword: string, newPassword: string): Observable<ApiResult> {
    console.log('service entered');
    this.loggedIn.user.password = newPassword;
    return this.http.put<ApiResult>(this.baseUrl + this.userUrl + `/${this.loggedIn.user.username}/${oldPassword}`, this.loggedIn.user);
  }
}
