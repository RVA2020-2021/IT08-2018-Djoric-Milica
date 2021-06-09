import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Smer } from 'src/app/models/smer';
import { Grupa } from 'src/app/models/grupa';
import {SmerService } from 'src/app/services/smer.service';
import {GrupaService } from 'src/app/services/grupa.service';

@Component({
  selector: 'app-grupa-dialog',
  templateUrl: './grupa-dialog.component.html',
  styleUrls: ['./grupa-dialog.component.css']
})
export class GrupaDialogComponent implements OnInit {

  public flag: number;
  smerovi: Smer[];

  constructor(public snackBar: MatSnackBar,
        public dialogRef: MatDialogRef<GrupaDialogComponent>,
        @Inject (MAT_DIALOG_DATA) public data: Grupa,
        public smerService: SmerService,
          public grupaService: GrupaService) { }

  ngOnInit(): void {
    this.smerService.getAllSmerovi().subscribe( data => 
      {
        this.smerovi = data;
      });
  }
  compareTo(a,b) {
    return a.id == b.id;
  }
  public add(): void {
    this.grupaService.addGrupa(this.data).subscribe(() => {
      this.snackBar.open('Smer uspešno dodat: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom dodavanja grupe. ' , 'Zatvori', {
        duration: 2500
      });
    }
    
  }
  public update(): void {
    this.grupaService.updateGrupa(this.data).subscribe(() => {
      this.snackBar.open('Grupa uspešno izmenjena: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom izmene grupe. ' , 'Zatvori', {
        duration: 2500
      });
    }
    
  }
  public delete(): void {
    this.grupaService.deleteGrupa(this.data.id).subscribe(() => {
      this.snackBar.open('Grupa uspešno obrisana: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom brisanja grupe. ' , 'Zatvori', {
        duration: 2500
      });
    }
    
  }
  public cancel(): void {
    this.dialogRef.close();
    this.snackBar.open('Odustali ste. ' , 'Zatvori', {
      duration: 1000
    });
  }
}
