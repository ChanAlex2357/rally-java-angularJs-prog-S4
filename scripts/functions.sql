-- Fonction pour recuperer le point power d'un rally pour un rang donnee
Create or replace function getPowerPointByRang(idR INT,ranks INT) 
    returns INT
    language plpgsql 
    AS
$$
declare
    max_rank INT;
begin
    -- Recuperer le rang max pour le rally specifier
    SELECT MAX(v_power_rank.rang) into max_rank from v_power_rank where v_power_rank.id_rally = 1;
    -- Conditionner la valeur de retour
    if ranks = max_rank then
      return -1;
    else
      return COALESCE (
        (SELECT valeur from Point where Point.rang = ranks AND Point.id_type_point = 3 )
        ,0
      );
    end if;
end;
$$;
CREATE OR REPLACE VIEW v_power_rank_point AS
SELECT
    v_power_rank.*,
    getPowerPointByRang(v_power_rank.id_rally,cast(v_power_rank.rang as INT)) AS points
FROM v_power_rank
LEFT JOIN point ON point.rang = v_power_rank.rang
                AND point.id_type_point = 3
ORDER BY id_rally,rang;
