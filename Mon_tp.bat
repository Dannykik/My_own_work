#!/bin/bash
Hommeplus20="HommesTousCoursPlus14"
Homme="Hommes_Reussi_Tous_Cours"
Dame="Dames_Moins3Cours.txt"
fichListe="Base_de_donnees.txt"
fichListetri="fichierTrier.txt"
BkFiltre="fichierfiltrer.txt"
ERTCours="Etudiant_Reussit_Tous_cours.txt"
NBweremana="Etudiant_Bweremana.txt"
Etu_vingt="Etudiants_plus_20_ans.txt"
echo "Ce programme vous permet de saisir votre identite et vos cotes dans les cours cité. Repondez moi en remplissant votre identite svp  "
for ((i=0;i<=14;i++))
do
	echo "Etudiant numéro $i"
	echo ""
	echo -n "Entrez votre nom svp : "
	read nom
	echo -n "Votre postnom : "
	read pnom
	echo -n "Le prenom : "
	read prnom
	echo -n "Le lieu de naissance : "
	read lnaiss
	echo -n "La date de naissance (ex: 25 02 2000) : "
	read dtnaiss
	echo -n "Sexe : "
	read sexe
	echo "veuillez donnez vos cotes aux cours de : "
	echo -n " Algorithme : "
	read ptAlgo
	echo -n " ECM : "
	read ptEcm
	echo -n " EDT : "
	read ptEdt
	echo -n " Algèbre : "
	read ptAlgebre
	echo -n "Java : "
	read ptJava
	if [[ $ptAlgo -gt 10 ]] && [[ $ptEcm -gt 10 ]] && [[ $ptEdt -gt 10 ]] && [[ $ptAlgebre -gt 10 ]] && [[ $ptJava -gt 10 ]]; then   
		echo "$nom $pnom $prnom, $dtnaiss $lnaiss $sexe $ptAlgo $ptEcm $ptEdt $ptAlgebre $ptJava" >> $ERTCours
	elif [[ $lnaiss -eq "Bweremana" ]]; then
		echo "$nom $pnom $prnom" >> $NBweremana
	fi
	echo "$nom $pnom $prnom, $dtnaiss $lnaiss $sexe $ptAlgo $ptEcm $ptEdt $ptAlgebre $ptJava" >> $fichListe
done

awk '{
  age = 2024 - $6
  if (age > 20)
  {
  	total = 0;
	for(i=0; i<=14; i++)
	{
		for(compteur=0; compteur<=5; compteur++)
        	{
                	i = compteur + 9
                	if($i >= 10)
                	{
                        	total = total + 1;
                	}	
        	}
       		 if (total >= 3)
        	{
               	print $1, $2, $3;  # Afficher le nom, postnom et prénom
        	}	
	}
  }
}' $fichListe >> $Etu_vingt

awk '{
  age = 2024 - $6
	total = 0;
        for(i=0; i<=14; i++)
        {
                for(compteur=0; compteur<=5; compteur++)
		{
                        i = compteur + 9
                        if($i >= 10)
                        {
                                total = total + 1;
                        }
                }
                 if (total > 3)
                {
                print $1, $2, $3;  # Afficher le nom, postnom et prénom
                }
        }

}'$fichListe >> $Dame


awk '{
	if ($8 == "M" && $9 > 10 && $10 > 10  && $11 > 10 && $12 > 10 && $13 > 10) 
	{
        print $1, $2, $3;  # Afficher le nom, postnom et prénom
        }
}'$fichListe >> $Homme
awk '{
	total = 0;
	for(i=9; i<=13; i++)
	{
		if ($i > 14){total = total + 1;}
		if (total >= 2)
        	{
        		print $1, $2, $3;  # Afficher le nom, postnom et prénom
       		}
}'$Homme >> $Hommeplus20
sort $fichListe > $fichListetri
echo "Fait par KIKWAYA KASINDI Danny, étudiant en L2 ULPGL-Goma année 2024 pour le cours d'introduction à UNIX et WINDOWS"
