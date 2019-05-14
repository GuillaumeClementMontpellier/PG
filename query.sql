
select sum(bareme) from devoir, contenu
where contenu.iddevoir = devoir.iddevoir and devoir.iddevoir=4;

select min(bareme) from devoir, contenu
where contenu.iddevoir = devoir.iddevoir and devoir.iddevoir=2;

select prof.nom, ville.nom from prof, ville, etablissement
where prof.idville = etablissement.idville and prof.idetablissement = etablissement.idetablissement and prof.idville=ville.idville;

select nom from ville
where not exists (select * from etablissement where etablissement.idville = ville.idville);

select nom from ville
where not exists (select * from prof where prof.idville = ville.idville);