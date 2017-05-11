/*Classement des clients par nombre d'occupations*/

SELECT T_CLIENT.CLI_NOM, T_CLIENT.CLI_PRENOM, COUNT(TJ_CHB_PLN_CLI.CLI_ID)
FROM TJ_CHB_PLN_CLI, T_CLIENT
GROUP BY T_CLIENT.CLI_NOM || T_CLIENT.CLI_PRENOM


/*Classement des client par montant dépensé dans l'hotel*/

SELECT CLI_ID, SUM(LIF_MONTANT) AS 'Montant dépensé'
FROM T_FACTURE fac, T_LIGNE_FACTURE lig
WHERE fac.FAC_ID=lig.FAC_ID
GROUP BY CLI_ID
ORDER BY SUM(LIF_MONTANT) ASC

/*Classement des occupation par mois*/

SELECT SUBSTR(PLN_JOUR,6,2) AS "Mois",count(PLN_JOUR) AS "Occupation"
FROM TJ_CHB_PLN_CLI
GROUP BY SUBSTR(PLN_JOUR,6,2)

/*Tarif moyen des chambre par années croissantes*/

SELECT SUBSTR(TRF_DATE_DEBUT,0,5) AS "Années", CHB_ID, AVG(TRF_CHB_PRIX)
FROM TJ_TRF_CHB
GROUP BY SUBSTR(TRF_DATE_DEBUT,0,5) || CHB_ID
ORDER BY Années ASC

/*Chambre la plus cher et en quelle année*/

SELECT CHB_ID, TRF_DATE_DEBUT, MAX(TRF_CHB_PRIX)
FROM TJ_TRF_CHB

/*Facture réglée avant leur édition*/

SELECT FAC_ID, CLI_ID,FAC_DATE, FAC_PMT_DATE
FROM T_FACTURE
WHERE (FAC_DATE > FAC_PMT_DATE)



/*Vous vous créez en tant que client de l'hotel*/

INSERT INTO T_CLIENT VALUES (101,'M.','KORMANN','Quentin',NULL)

/*Ne pas oublier vos moyens de communication*/

INSERT INTO T_TELEPHONE VALUES (251,101,'GSM','06-79-55-38-07','Mobile')

/*Cous créez une nouvelle chambre à la date du jour*/

INSERT INTO T_CHAMBRE VALUES (21,22,'3e',1,1,1,3,121);
INSERT INTO TJ_TRF_CHB VALUES (21,date('Y-m-d'),676);

/*Le règlement de votre facture sera effectué en CB*/

INSERT INTO T_FACTURE VALUES (2375,101,'CB',date('Y-m-d'),date('Y-m-d'))

