
INSERT INTO smer (id,naziv,oznaka)
	VALUES(1, 'Inzenjerstvo informacionih sistema','IT');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(2,'Inzenjerski menadzment','IM');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(3,'Softversko inzenjerstvo i informacione tehnologije','SW');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(4,'Industrijsko inzenjerstvo','II');
INSERT INTO smer (id,naziv,oznaka)
	VALUES(-100,'Smer test', 'Oznaka test');

INSERT INTO grupa (id, oznaka, smer)
	VALUES(1,'G_IT',1);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(2,'G_II',4);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(3,'G_IM',2);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(4,'G_SW',3);
INSERT INTO grupa (id, oznaka, smer)
	VALUES(-100,'Oz test',1);

	
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(1,'Projektovanje baze podataka za podrsku poslovanju Koncept bara','BP_036','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(2,'Obrada statistickih podataka na osnovu sprovedenog istrazivanja','S_527','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(3,'Primena razlicitih materijala u inzenjerstvu','MAT','Opis');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(4,'Testiranje softvera ','Opis','P_036');
INSERT INTO projekat (id, naziv, oznaka, opis)
	VALUES(-100,'Projekat test','Oz test','Op test');
	
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(1,'Pera','Peric','IT1',1,1);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(2,'Nikola','Nikolic','IM2',3,2);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(3,'Jovana','Jovanvic','SW3',4,4);	
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(4,'Milana','Milanovic','II4',2,3);
INSERT INTO student (id, ime, prezime, broj_indeksa, grupa, projekat)
	VALUES(-100,'Ime test','Prz test','BrI test',1,1);
