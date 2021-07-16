import { Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Subscription } from 'rxjs';
import { Projekat } from 'src/app/models/projekat';
import { Student } from 'src/app/models/student';
import { ProjekatService } from 'src/app/services/projekat.service';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'app-student-dialog',
  templateUrl: './student-dialog.component.html',
  styleUrls: ['./student-dialog.component.css']
})
export class StudentDialogComponent implements OnInit, OnDestroy {

  public flag: number;
  projekti: Projekat[];
  projekatSubscription: Subscription;

  constructor( public snackBar: MatSnackBar,
    public dialogRef: MatDialogRef<StudentDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Student,
    public projekatService:   ProjekatService,
    public studentService: StudentService
  ) { }

  ngOnDestroy(): void {
    this.projekatSubscription.unsubscribe();
  }

  ngOnInit(): void {
    this.projekatSubscription = this.projekatService.getAllProjekti().subscribe(
      data => {
        this.projekti = data;
      }
    ),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
    }
  }

  compareTo(a,b) {
    return a.id == b.id;
  }

  public add(): void {
    this.studentService.addStudent(this.data).subscribe(() => {
      this.snackBar.open('Student uspešno dodat.' , 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom dodavanja studenta. ' , 'Zatvori', {
        duration: 2500
      });
    }
    
  }
  public update(): void {
    this.studentService.updateStudent(this.data).subscribe(() => {
      this.snackBar.open('Student uspešno izmenjen: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom izmene studenta. ' , 'Zatvori', {
        duration: 2500
      });
    }
    
  }
  public delete(): void {
    this.studentService.deleteStudent(this.data.id).subscribe(() => {
      this.snackBar.open('student uspešno obrisan: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error.name);
      this.snackBar.open('Došlo je do greške prilikom brisanja studenta. ' , 'Zatvori', {
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