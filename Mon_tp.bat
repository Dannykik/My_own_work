Homme="HommesTousCoursPlus14"
Dame="DamesMoins3Cours.txt"
fichListe="Maliste.txt"
fichListetri="fichierTrier.txt"
BkFiltre="fichierfiltrer.txt"
ERTCours="Etudiant_Reussit_Tous_cours.txt"
NBweremana="EtuBweremana.txt"
Etu_vingt="etudiants_plus_20_ans.txt"
echo "Ce programme vous permet de saisir votre identite. Repondez moi en remplissant votre identite svp  "
for ((i=0;i<=0;i++))
do
	echo "Etudiant numero$i"
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
awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}' $fichListe

awk '{
  age = 2024 - $6
  if (age > 20)
  {
  	total = 0;
	for(i=0; i<=4; i++)
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
    if ($6 == "F" && NF <= 10) {
        print $1, $2, $3;  # Afficher le nom, postnom et prénom
    }
}' $fichListe >> $Dame

awk '{
    if ($6 == "M" && $9 > 14 && $10 > 14 && NF == 11) {
        print $1, $2, $3;  # Afficher le nom, postnom et prénom
    }
}' $fichListe >> $Homme
sort $fichListe > $fichListetri
