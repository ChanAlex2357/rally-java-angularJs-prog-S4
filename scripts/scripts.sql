CREATE TABLE Rally (
    id_rally Serial PRIMARY KEY,
    nom_rally VARCHAR(50),
    date_rally DATE
);

CREATE TABLE CategoriePilote (
    id_categorie Serial PRIMARY KEY,
    nom_categorie VARCHAR(50)
);

CREATE TABLE Pilote (
    id_pilote Serial PRIMARY KEY,
    nom_pilote VARCHAR(50),
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES CategoriePilote(id_categorie)
);

CREATE TABLE Specials (
    id_special Serial PRIMARY KEY,
    tire_special VARCHAR(50),
    distance decimal(10,2)
);
CREATE TABLE Chrono (
    id_chrono serial PRIMARY KEY,
    id_rally INT,
    id_special INT,
    id_pilote INT,
    temps Interval,
    FOREIGN KEY (id_special) REFERENCES Specials(id_special),
    FOREIGN KEY (id_pilote) REFERENCES Pilote(id_pilote)
);

CREATE TABLE TypePoint (
    id_type_point Serial PRIMARY KEY,
    nom_type VARCHAR(50)
);

Create TABLE Point (
    id_type_point int,
    rang int,
    valeur int,
    FOREIGN KEY(id_type_point) REFERENCES TypePoint(id_type_point)
);

CREATE TABLE PowerSpecial (
    id_rally INT,
    id_special INT,
    stage INT,
    PRIMARY KEY (id_rally, id_special),
    FOREIGN KEY (id_rally) REFERENCES Rally(id_rally),
    FOREIGN KEY (id_special) REFERENCES Specials(id_special)
);



-- View pour les pilotes et leur categorie
Create or replace view v_pilote_categorie as
select pilote.* , CategoriePilote.nom_categorie
from pilote
join CategoriePilote on CategoriePilote.id_categorie = pilote.id_categorie;


-- general points
create or replace view v_ranked_point as 
select point.* from point where id_type_point=1;
-- categorie points
create or replace view v_categorie_point as 
select point.* from point where id_type_point=2;

-- View pour recuperer le temps pour chaque rally
-- Classement General sans les points
    create or replace view v_rally_general_ranked as
    SELECT  id_rally,
            v_pilote_categorie.id_Pilote AS id_pilote, 
            v_pilote_categorie.nom_pilote AS nom_pilote , 
            v_pilote_categorie.id_categorie AS id_categorie, 
            v_pilote_categorie.nom_categorie AS nom_categorie,
            SUM(temps) AS temps,
            ROW_NUMBER() OVER (PARTITION BY id_rally ORDER BY SUM(temps)) AS rang
    FROM chrono 
    join v_pilote_categorie as v_pilote_categorie on chrono.id_pilote = v_pilote_categorie.id_pilote
    GROUP BY    v_pilote_categorie.id_pilote ,
                id_rally , 
                v_pilote_categorie.nom_pilote , 
                v_pilote_categorie.id_categorie, 
                v_pilote_categorie.nom_categorie
    ORDER BY id_rally ,temps ASC;

-- Classement par categorie
    create or replace view v_rally_categorie_ranked as
    SELECT  id_rally,
            v_pilote_categorie.id_Pilote AS id_pilote, 
            v_pilote_categorie.nom_pilote AS nom_pilote , 
            v_pilote_categorie.id_categorie AS id_categorie, 
            v_pilote_categorie.nom_categorie AS nom_categorie,
            SUM(temps) AS temps,
            ROW_NUMBER() OVER (PARTITION BY id_rally , nom_categorie ORDER BY SUM(temps)) AS rang
    FROM chrono 
    join v_pilote_categorie as v_pilote_categorie on chrono.id_pilote = v_pilote_categorie.id_pilote
    GROUP BY    v_pilote_categorie.id_pilote ,
                id_rally ,
                v_pilote_categorie.nom_pilote , 
                v_pilote_categorie.id_categorie, 
                v_pilote_categorie.nom_categorie
    ORDER BY id_rally ,temps ASC;


-- Classement avec point gagne
    CREATE or replace view v_rally_general_ranked_points as
    select v_rally_general_ranked.* , COALESCE(point.valeur,0) as points
    from v_rally_general_ranked
    left join v_ranked_point as point on point.rang = v_rally_general_ranked.rang;

-- Classement categorie avec points
    CREATE or replace view v_rally_categorie_ranked_points as
    select v_rally_categorie_ranked.* , COALESCE(point.valeur,0) as points
    from v_rally_categorie_ranked
    left join v_categorie_point as point on point.rang = v_rally_categorie_ranked.rang;


-- Rally Wins
    Create or replace view v_rally_wins as
    select v_grp.id_pilote , count(distinct v_grp.id_rally) as wins
    from v_rally_general_ranked as v_grp
    where rang = 1
    group by v_grp.id_pilote;

-- Classement avec le nombre de rally gagner
    create or replace view v_pre_final_rank as
    select  v_grp.id_pilote,
            v_grp.nom_pilote,
            v_grp.nom_categorie,
            sum(v_grp.temps) as temps_total,
            sum(v_grp.points) as points
    from v_rally_general_ranked_points as v_grp
    group by v_grp.id_pilote,v_grp.nom_pilote,v_grp.nom_categorie;

    create or replace view v_final_rank as
    select  v_pfr.* ,
            COALESCE(v_rw.wins, 0) AS rally_gagner,
            ROW_NUMBER() OVER (ORDER BY v_pfr.temps_total, COALESCE(v_rw.wins, 0) DESC) AS final_rank
    from v_pre_final_rank as v_pfr
    left join v_rally_wins as v_rw on v_rw.id_pilote =  v_pfr.id_pilote;

-- Cette vue récupère les power specials avec le stage le plus élevé pour chaque rally.
CREATE OR REPLACE VIEW v_power_special AS
SELECT id_rally, id_special, stage
FROM PowerSpecial
WHERE (id_rally, stage) IN (
    SELECT id_rally, MAX(stage)
    FROM PowerSpecial
    GROUP BY id_rally
);
-- Cette vue récupère le classement pour chaque spécial, similaire à v_rally_general_ranked.
CREATE OR REPLACE VIEW v_special_ranked AS
SELECT
    chrono.id_rally,
    chrono.id_special,
    chrono.id_pilote,
    v_pilote_categorie.nom_pilote,
    v_pilote_categorie.id_categorie AS id_categorie,
    v_pilote_categorie.nom_categorie,
    chrono.temps,
    ROW_NUMBER() OVER (PARTITION BY chrono.id_rally, chrono.id_special ORDER BY chrono.temps) AS rang
FROM chrono
JOIN v_pilote_categorie ON chrono.id_pilote = v_pilote_categorie.id_pilote;

-- Cette vue lie le classement des spécials avec les power specials.
CREATE OR REPLACE VIEW v_power_rank AS
SELECT
    v_special_ranked.id_rally,
    v_special_ranked.id_special,
    v_special_ranked.id_pilote,
    v_special_ranked.nom_pilote,
    v_special_ranked.id_categorie,
    v_special_ranked.nom_categorie,
    v_special_ranked.temps,
    v_special_ranked.rang
FROM v_special_ranked
JOIN v_power_special ON v_special_ranked.id_rally = v_power_special.id_rally
                      AND v_special_ranked.id_special = v_power_special.id_special
ORDER BY v_special_ranked.id_rally,v_special_ranked.rang;

-- Cette vue associe le classement des power specials avec les points dont le type est 3.
CREATE OR REPLACE VIEW v_power_rank_point AS
SELECT
    v_power_rank.*,
    COALESCE(point.valeur, 0) AS points
FROM v_power_rank
LEFT JOIN point ON point.rang = v_power_rank.rang
                AND point.id_type_point = 3
ORDER BY id_rally,rang;

-- TOTAL DE POINT PAR RALLY
CREATE OR REPLACE VIEW v_total_points_per_rally AS
SELECT
    v_rally_general_ranked_points.id_rally,
    v_rally_general_ranked_points.id_pilote,
    v_rally_general_ranked_points.nom_pilote,
    v_rally_general_ranked_points.nom_categorie,
    v_rally_general_ranked_points.id_categorie,
    v_rally_general_ranked_points.temps,
    v_rally_general_ranked_points.points AS general_points,
    COALESCE(v_power_rank_point.points, 0) AS power_points,
    (v_rally_general_ranked_points.points + COALESCE(v_power_rank_point.points, 0)) AS total_points
FROM v_rally_general_ranked_points
LEFT JOIN v_power_rank_point ON v_rally_general_ranked_points.id_rally = v_power_rank_point.id_rally
                             AND v_rally_general_ranked_points.id_pilote = v_power_rank_point.id_pilote;


drop view v_final_rank;
drop view v_pre_final_rank;
-- NEW PRE FINAL
CREATE OR REPLACE VIEW v_pre_final_rank AS
SELECT
    v_total_points_per_rally.id_pilote,
    v_total_points_per_rally.nom_pilote,
    v_total_points_per_rally.nom_categorie,
    v_total_points_per_rally.id_categorie,
    sum(v_total_points_per_rally.temps) as total_temps,
    SUM(v_total_points_per_rally.total_points) AS total_points,
    SUM(v_total_points_per_rally.general_points) AS general_points,
    SUM(v_total_points_per_rally.power_points) AS power_points
FROM v_total_points_per_rally
GROUP BY v_total_points_per_rally.id_pilote,
         v_total_points_per_rally.nom_pilote,
         v_total_points_per_rally.nom_categorie,
         v_total_points_per_rally.id_categorie;
-- NEW FINAL
CREATE OR REPLACE VIEW v_final_rank AS
SELECT
    v_pre_final_rank.*,
    COALESCE(v_rally_wins.wins, 0) AS rally_wins,
    ROW_NUMBER() OVER (ORDER BY v_pre_final_rank.total_points DESC, COALESCE(v_rally_wins.wins, 0) DESC) AS final_rank
FROM v_pre_final_rank
LEFT JOIN v_rally_wins ON v_rally_wins.id_pilote = v_pre_final_rank.id_pilote;


--- CATEGORIE FINAL RANK ---
-- NEW PRE FINAL
CREATE OR REPLACE VIEW v_pre_categorie_rank AS
SELECT
    v_rally_categorie_ranked_points.id_pilote,
    v_rally_categorie_ranked_points.nom_pilote,
    v_rally_categorie_ranked_points.nom_categorie,
    v_rally_categorie_ranked_points.id_categorie,
    sum(v_rally_categorie_ranked_points.temps) as total_temps,
    SUM(v_rally_categorie_ranked_points.points) AS total_points
FROM v_rally_categorie_ranked_points
GROUP BY v_rally_categorie_ranked_points.id_pilote,
         v_rally_categorie_ranked_points.nom_pilote,
         v_rally_categorie_ranked_points.nom_categorie,
         v_rally_categorie_ranked_points.id_categorie;
-- NEW FINAL
CREATE OR REPLACE VIEW v_categorie_rank AS
SELECT
    v_pre_categorie_rank.*,
    ROW_NUMBER() OVER (ORDER BY v_pre_categorie_rank.id_categorie,v_pre_categorie_rank.total_points DESC ) AS rank
FROM v_pre_categorie_rank;
