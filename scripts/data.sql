-- Categorie 
INSERT INTO CategoriePilote VALUES(default , 'A');
INSERT INTO CategoriePilote VALUES(default , 'B');

-- Pilote
INSERT INTO pilote VALUES (1 , 'c1' , 2);
INSERT INTO pilote VALUES (2 , 'c2' , 1);
INSERT INTO pilote VALUES (3 , 'c3' , 1);
INSERT INTO pilote VALUES (4 , 'c4' , 2);
INSERT INTO pilote VALUES (5 , 'c5' , 2);
INSERT INTO pilote VALUES (6 , 'c6' , 1);
-- Specials
INSERT INTO Specials VALUES (1 , 'Special 1' , 100);
INSERT INTO Specials VALUES (2 , 'Special 1' , 100);
INSERT INTO Specials VALUES (3 , 'Special 1' , 100);
INSERT INTO Specials VALUES (4 , 'Special 1' , 100);
INSERT INTO Specials VALUES (5 , 'Special 1' , 100);
INSERT INTO Specials VALUES (6 , 'Special 1' , 100);
-- Rally
INSERT INTO Rally VALUES (1,'Rally 1',now());
INSERT INTO Rally VALUES (2,'Rally 2',now());
INSERT INTO Rally VALUES (3,'Rally 3',now());
INSERT INTO Rally VALUES (4,'Rally 4',now());
INSERT INTO Rally VALUES (5,'Rally 5',now());
INSERT INTO Rally VALUES (6,'Rally 6',now());

-- Types de point possibles
INSERT INTO TypePoint VALUES (1,'point championat');
INSERT INTO TypePoint VALUES (2,'point categorie');
INSERT INTO TypePoint VALUES (3,'point power stage');

-- Point de championat
INSERT INTO Point values (1,10,1);
INSERT INTO Point values (1,9,2);
INSERT INTO Point values (1,8,3);
INSERT INTO Point values (1,7,4);
INSERT INTO Point values (1,6,5);
INSERT INTO Point values (1,5,6);
INSERT INTO Point values (1,4,7);
INSERT INTO Point values (1,3,8);
INSERT INTO Point values (1,2,9);
INSERT INTO Point values (1,1,10);

INSERT INTO Point values (2,1,10);
INSERT INTO Point values (2,2,9);
INSERT INTO Point values (2,3,8);
INSERT INTO Point values (2,4,7);
INSERT INTO Point values (2,5,6);

INSERT INTO Point values (3,1,5);
INSERT INTO Point values (3,2,4);
INSERT INTO Point values (3,3,3);
INSERT INTO Point values (3,4,2);
INSERT INTO Point values (3,5,1);


-- Chrono
-- Rally  1
-- Concurrent1
INSERT INTO chrono VALUES (default,1,1,1,'12 minutes 45 seconds 400 milliseconds');
INSERT INTO chrono VALUES (default,1,2,1,'15 minutes 22 seconds 300 milliseconds');
INSERT INTO chrono VALUES (default,1,3,1,'11 minutes 09 seconds 268 milliseconds');
INSERT INTO chrono VALUES (default,1,4,1,'26 minutes 39 seconds 267 milliseconds');
INSERT INTO chrono VALUES (default,1,5,1,'19 minutes 23 seconds 280 milliseconds');

-- Concurrent2
INSERT INTO chrono VALUES (default,1,1,2,'21 minutes 15 seconds 275 milliseconds');
INSERT INTO chrono VALUES (default,1,2,2,'22 minutes 18 seconds 338 milliseconds');
INSERT INTO chrono VALUES (default,1,3,2,'12 minutes 15 seconds 735 milliseconds');
INSERT INTO chrono VALUES (default,1,4,2,'19 minutes 46 seconds 186 milliseconds');
INSERT INTO chrono VALUES (default,1,5,2,'24 minutes 06 seconds 446 milliseconds');

-- Concurrent3
INSERT INTO chrono VALUES (default,1,1,3,'25 minutes 13 seconds 251 milliseconds');
INSERT INTO chrono VALUES (default,1,2,3,'14 minutes 52 seconds 145 milliseconds');
INSERT INTO chrono VALUES (default,1,3,3,'11 minutes 29 seconds 113 milliseconds');
INSERT INTO chrono VALUES (default,1,4,3,'26 minutes 10 seconds 261 milliseconds');
INSERT INTO chrono VALUES (default,1,5,3,'28 minutes 47 seconds 285 milliseconds');

-- Concurrent4
INSERT INTO chrono VALUES (default,1,1,4,'16 minutes 09 seconds 169 milliseconds');
INSERT INTO chrono VALUES (default,1,2,4,'17 minutes 20 seconds 172 milliseconds');
INSERT INTO chrono VALUES (default,1,3,4,'32 minutes 29 seconds 323 milliseconds');
INSERT INTO chrono VALUES (default,1,4,4,'22 minutes 48 seconds 225 milliseconds');
INSERT INTO chrono VALUES (default,1,5,4,'29 minutes 10 seconds 291 milliseconds');

-- Concurrent5
INSERT INTO chrono VALUES (default,1,1,5,'16 minutes 36 seconds 164 milliseconds');
INSERT INTO chrono VALUES (default,1,2,5,'33 minutes 13 seconds 331 milliseconds');
INSERT INTO chrono VALUES (default,1,3,5,'11 minutes 41 seconds 114 milliseconds');
INSERT INTO chrono VALUES (default,1,4,5,'29 minutes 21 seconds 292 milliseconds');
INSERT INTO chrono VALUES (default,1,5,5,'29 minutes 57 seconds 296 milliseconds');

-- Concurrent6
INSERT INTO chrono VALUES (default,1,1,6,'27 minutes 48 seconds 275 milliseconds');
INSERT INTO chrono VALUES (default,1,2,6,'16 minutes 17 seconds 162 milliseconds');
INSERT INTO chrono VALUES (default,1,3,6,'15 minutes 47 seconds 155 milliseconds');
INSERT INTO chrono VALUES (default,1,4,6,'21 minutes 53 seconds 215 milliseconds');
INSERT INTO chrono VALUES (default,1,5,6,'27 minutes 24 seconds 272 milliseconds');

-- speciale 6 
INSERT INTO chrono VALUES (default,1,6,1,'38 minutes 59 seconds 852 milliseconds');
INSERT INTO chrono VALUES (default,1,6,2,'17 minutes 55 seconds 075 milliseconds');
INSERT INTO chrono VALUES (default,1,6,3,'13 minutes 57 seconds 136 milliseconds');
INSERT INTO chrono VALUES (default,1,6,4,'34 minutes 19 seconds 342 milliseconds');
INSERT INTO chrono VALUES (default,1,6,5,'31 minutes 54 seconds 315 milliseconds');
INSERT INTO chrono VALUES (default,1,6,6,'34 minutes 48 seconds 345 milliseconds');



-- rallye 2
-- concurrent 1
INSERT INTO chrono VALUES (default,2,1,1,'12 minutes 45 seconds 400 milliseconds');
INSERT INTO chrono VALUES (default,2,2,1,'15 minutes 22 seconds 300 milliseconds');
INSERT INTO chrono VALUES (default,2,3,1,'11 minutes 09 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,2,4,1,'26 minutes 39 seconds 267 milliseconds');
INSERT INTO chrono VALUES (default,2,5,1,'19 minutes 23 seconds 280 milliseconds');
INSERT INTO chrono VALUES (default,2,6,1,'38 minutes 59 seconds 852 milliseconds');

-- Concurent 2
INSERT INTO chrono VALUES (default,2,1,2,'21 minutes 15 seconds 275 milliseconds');
INSERT INTO chrono VALUES (default,2,2,2,'23 minutes 18 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,2,3,2,'12 minutes 15 seconds 735 milliseconds');
INSERT INTO chrono VALUES (default,2,4,2,'19 minutes 46 seconds 186 milliseconds');
INSERT INTO chrono VALUES (default,2,5,2,'24 minutes 06 seconds 446 milliseconds');
INSERT INTO chrono VALUES (default,2,6,2,'17 minutes 55 seconds 075 milliseconds');

-- Concurrent 3
INSERT INTO chrono VALUES (default,2,1,3,'25 minutes 13 seconds 251 milliseconds');
INSERT INTO chrono VALUES (default,2,2,3,'10 minutes 52 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,2,3,3,'11 minutes 29 seconds 113 milliseconds');
INSERT INTO chrono VALUES (default,2,4,3,'26 minutes 10 seconds 261 milliseconds');
INSERT INTO chrono VALUES (default,2,5,3,'28 minutes 47 seconds 285 milliseconds');
INSERT INTO chrono VALUES (default,2,6,3,'13 minutes 57 seconds 136 milliseconds');

-- Concurrent 4
INSERT INTO chrono VALUES (default,2,1,4,'16 minutes 09 seconds 169 milliseconds');
INSERT INTO chrono VALUES (default,2,2,4,'17 minutes 20 seconds 172 milliseconds');
INSERT INTO chrono VALUES (default,2,3,4,'32 minutes 29 seconds 323 milliseconds');
INSERT INTO chrono VALUES (default,2,4,4,'22 minutes 48 seconds 225 milliseconds');
INSERT INTO chrono VALUES (default,2,5,4,'29 minutes 10 seconds 291 milliseconds');
INSERT INTO chrono VALUES (default,2,6,4,'34 minutes 19 seconds 342 milliseconds');

-- Concurrent 5
INSERT INTO chrono VALUES (default,2,1,5,'16 minutes 36 seconds 164 milliseconds');
INSERT INTO chrono VALUES (default,2,2,5,'13 minutes 13 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,2,3,5,'11 minutes 41 seconds 114 milliseconds');
INSERT INTO chrono VALUES (default,2,4,5,'29 minutes 21 seconds 292 milliseconds');
INSERT INTO chrono VALUES (default,2,5,5,'19 minutes 57 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,2,6,5,'11 minutes 54 seconds 000 milliseconds');

-- Concurrent 6
INSERT INTO chrono VALUES (default,2,1,6,'27 minutes 48 seconds 275 milliseconds');
INSERT INTO chrono VALUES (default,2,2,6,'16 minutes 17 seconds 162 milliseconds');
INSERT INTO chrono VALUES (default,2,3,6,'15 minutes 47 seconds 155 milliseconds');
INSERT INTO chrono VALUES (default,2,4,6,'21 minutes 53 seconds 215 milliseconds');
INSERT INTO chrono VALUES (default,2,5,6,'27 minutes 24 seconds 272 milliseconds');
INSERT INTO chrono VALUES (default,2,6,6,'34 minutes 48 seconds 345 milliseconds');


-- Rallye 3
-- concurrent 1
INSERT INTO chrono VALUES (default,3,1,1,'12 minutes 45 seconds 400 milliseconds');
INSERT INTO chrono VALUES (default,3,2,1,'15 minutes 22 seconds 300 milliseconds');
INSERT INTO chrono VALUES (default,3,3,1,'12 minutes 09 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,3,4,1,'16 minutes 39 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,3,5,1,'19 minutes 23 seconds 280 milliseconds');
INSERT INTO chrono VALUES (default,3,6,1,'38 minutes 59 seconds 852 milliseconds');

-- Concurent 2
INSERT INTO chrono VALUES (default,3,1,2,'21 minutes 15 seconds 275 milliseconds');
INSERT INTO chrono VALUES (default,3,2,2,'22 minutes 18 seconds 338 milliseconds');
INSERT INTO chrono VALUES (default,3,3,2,'12 minutes 15 seconds 735 milliseconds');
INSERT INTO chrono VALUES (default,3,4,2,'19 minutes 46 seconds 186 milliseconds');
INSERT INTO chrono VALUES (default,3,5,2,'24 minutes 06 seconds 446 milliseconds');
INSERT INTO chrono VALUES (default,3,6,2,'17 minutes 55 seconds 075 milliseconds');

-- Concurrent 3
INSERT INTO chrono VALUES (default,3,1,3,'25 minutes 13 seconds 251 milliseconds');
INSERT INTO chrono VALUES (default,3,2,3,'14 minutes 52 seconds 145 milliseconds');
INSERT INTO chrono VALUES (default,3,3,3,'11 minutes 29 seconds 113 milliseconds');
INSERT INTO chrono VALUES (default,3,4,3,'22 minutes 10 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,3,5,3,'28 minutes 47 seconds 285 milliseconds');
INSERT INTO chrono VALUES (default,3,6,3,'34 minutes 48 seconds 345 milliseconds');

-- Concurrent 4
INSERT INTO chrono VALUES (default,3,1,4,'16 minutes 09 seconds 169 milliseconds');
INSERT INTO chrono VALUES (default,3,2,4,'17 minutes 20 seconds 172 milliseconds');
INSERT INTO chrono VALUES (default,3,3,4,'32 minutes 29 seconds 323 milliseconds');
INSERT INTO chrono VALUES (default,3,4,4,'22 minutes 48 seconds 225 milliseconds');
INSERT INTO chrono VALUES (default,3,5,4,'29 minutes 10 seconds 291 milliseconds');
INSERT INTO chrono VALUES (default,3,6,4,'34 minutes 19 seconds 342 milliseconds');

-- Concurrent 5
INSERT INTO chrono VALUES (default,3,1,5,'16 minutes 36 seconds 164 milliseconds');
INSERT INTO chrono VALUES (default,3,2,5,'33 minutes 13 seconds 331 milliseconds');
INSERT INTO chrono VALUES (default,3,3,5,'11 minutes 41 seconds 114 milliseconds');
INSERT INTO chrono VALUES (default,3,4,5,'29 minutes 21 seconds 292 milliseconds');
INSERT INTO chrono VALUES (default,3,5,5,'29 minutes 57 seconds 296 milliseconds');
INSERT INTO chrono VALUES (default,3,6,5,'31 minutes 54 seconds 315 milliseconds');

-- Concurrent 6
INSERT INTO chrono VALUES (default,3,1,6,'20 minutes 48 seconds 000 milliseconds');
INSERT INTO chrono VALUES (default,3,2,6,'16 minutes 17 seconds 162 milliseconds');
INSERT INTO chrono VALUES (default,3,3,6,'15 minutes 47 seconds 155 milliseconds');
INSERT INTO chrono VALUES (default,3,4,6,'21 minutes 53 seconds 215 milliseconds');
INSERT INTO chrono VALUES (default,3,5,6,'27 minutes 24 seconds 272 milliseconds');
INSERT INTO chrono VALUES (default,3,6,6,'14 minutes 48 seconds 000 milliseconds');


INSERT INTO PowerSpecial VALUES (1,1,1);
INSERT INTO PowerSpecial VALUES (1,2,2);
INSERT INTO PowerSpecial VALUES (1,3,3);
INSERT INTO PowerSpecial VALUES (1,4,4);
INSERT INTO PowerSpecial VALUES (1,5,5);
INSERT INTO PowerSpecial VALUES (1,6,6);

INSERT INTO PowerSpecial VALUES (2,1,1);
INSERT INTO PowerSpecial VALUES (2,2,2);
INSERT INTO PowerSpecial VALUES (2,3,3);
INSERT INTO PowerSpecial VALUES (2,4,4);
INSERT INTO PowerSpecial VALUES (2,5,5);
INSERT INTO PowerSpecial VALUES (2,6,6);

INSERT INTO PowerSpecial VALUES (3,1,1);
INSERT INTO PowerSpecial VALUES (3,2,2);
INSERT INTO PowerSpecial VALUES (3,3,3);
INSERT INTO PowerSpecial VALUES (3,4,4);
INSERT INTO PowerSpecial VALUES (3,5,5);
INSERT INTO PowerSpecial VALUES (3,6,6);
