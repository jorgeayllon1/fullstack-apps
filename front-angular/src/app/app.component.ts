import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { UsersListComponent } from './components/users-list/users-list.component';
import { UserService } from './service/user.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet,UsersListComponent],
  template: `
    <h1>Welcome to {{title}}!</h1>
    <app-users-list></app-users-list>
    <router-outlet></router-outlet>
  `,
  styles: [],
})
export class AppComponent {
  title = 'front-angular';
}
