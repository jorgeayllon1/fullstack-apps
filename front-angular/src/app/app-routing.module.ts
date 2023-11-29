import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { routes as appRoutes } from './app.routes';

@NgModule({
  imports: [RouterModule.forChild(appRoutes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
