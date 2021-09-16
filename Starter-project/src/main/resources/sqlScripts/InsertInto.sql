
INSERT INTO smer (id,naziv,oznaka)
	VALUES(nextval('smer_seq'), 'Inzenjerstvo informacionih sistema','IT');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(nextval('smer_seq'),'Inzenjerski menadzment','IM');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(nextval('smer_seq'),'Softversko inzenjerstvo i informacione tehnologije','SW');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(nextval('smer_seq'),'Industrijsko inzenjerstvo','II');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(-100,'Smer test', 'Oznaka test');

INSERT INTO grupa (id, oznaka, smer)
	VALUES(nextval('grupa_seq'),'G_IT',1);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(nextval('grupa_seq'),'G_II',4);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(nextval('grupa_seq'),'G_IM',2);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(nextval('grupa_seq'),'G_SW',3);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(-100,'Oz test',1);

	
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(nextval('projekat_seq'),'Projektovanje baze podataka za podrsku poslovanju Koncept bara','BP_036','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(nextval('projekat_seq'),'Obrada statistickih podataka na osnovu sprovedenog istrazivanja','S_527','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(nextval('projekat_seq'),'Primena razlicitih materijala u inzenjerstvu','MAT','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(nextval('projekat_seq'),'Testiranje softvera ','P_036','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(-100,'Projekat test','Oz test','Op test');
	
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(nextval('student_seq'),'Pera','Peric','IT1',1,1);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(nextval('student_seq'),'Nikola','Nikolic','IM2',3,2);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(nextval('student_seq'),'Jovana','Jovanvic','SW3',4,4);	
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(nextval('student_seq'),'Milana','Milanovic','II4',2,3);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(-100,'Ime test','Prz test','BrI test',1,1);
