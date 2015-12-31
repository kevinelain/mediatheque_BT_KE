class PERSONNEL inherit ADHERENT
 rename make as make_adherent, affichage_test as affichage_test_adh end
 
creation {ANY}
	make, set_matricule
	
feature {ANY}
        matricule: STRING
        
feature {ANY}
	--constructeur de la classe
	make(new_id: STRING; new_nom: STRING; new_prenom: STRING; new_adresse: STRING; new_date_naiss: STRING; new_matricule :STRING) is
		do
			make_adherent(new_id, new_nom, new_prenom, new_adresse, new_date_naiss)
			matricule:=new_matricule
		end
		
	--Fonction d'affichage test
	affichage_test is
		do
			affichage_test_adh
			io.put_string("%N"+matricule+"%N")
		end

	set_matricule(new_matricule: STRING)is
		do
                     matricule:=new_matricule
		end  

	get_matricule : STRING is
              do
                     Result:=matricule
              end
end
