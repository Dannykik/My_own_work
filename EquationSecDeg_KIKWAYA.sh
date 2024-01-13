#!/bin/bash

# On définit les coefficients de l'équation
read -p "Coefficient a : " a
read -p "Coefficient b : " b
read -p "Coefficient c : " c

format_number() {
    printf "%.2f" "$1"
}

# On calcule le discriminant 
delta=$(($b**2 - 4*$a*$c))

# On affiche l'équation
echo "Equation: $a*x^2 + $b*x + $c = 0 et delta vaut $delta"

# On teste le signe du discriminant
if [[ $delta -gt 0 ]]; then
	# Deux solutions réelles distinctes
	racDel=$(echo "sqrt($delta)" | bc -l)
	echo "Racine carée de delta est : $(format_number $racDel)"
	x1=$(echo "(-$b - sqrt($delta))/(2*$a)" | bc -l)
    	x2=$(echo "(-$b + sqrt($delta))/(2*$a)" | bc -l)
	echo "Deux solutions réelles: x1 = $(format_number $x1) et x2 = $(format_number $x2)"
elif [[ $delta -eq 0 ]]; then
    	# Une solution réelle double:
	x=$(echo "-$b/(2*$a)" | bc -l)
	echo "Une solution réelle: x = $(format_number $x)"
else
	# Pas de solution réelle, deux solutions complexes
	delta=$((-1*$delta))
	racDel=$(echo "sqrt($delta)" | bc -l)
	echo "Racine de delta est $racDel"
	x1=$(echo "(-$b - sqrt($racDel))/(2*$a)" | bc -l)
	x2=$(echo "(-$b + sqrt($racDel))/(2*$a)" | bc -l)
	echo "Pas de solution réelle, deux solutions complexes: x1 = $(format_number $x1)i et x2 = $(format_number $x2)i"
fi

