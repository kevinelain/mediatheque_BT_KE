class PERSONNEL inherit ADHERENT
 rename make as make_adherent, affichage_test as affichage_test_adh, get_text_file as get_text_file_adh end
 
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
		
	--On affiche les informations du membre du personnel
	affichage_test is
		do
			affichage_test_adh
			io.put_string(" matricule: "+matricule+"%N")
		end

	--Le setteur de la classe
	set_matricule(new_matricule: STRING)is
		do
                     matricule:=new_matricule
		end  

	--getter de la classe
	get_matricule : STRING is
              do
                     Result:=matricule
              end
              
	get_text_file : STRING is
		do
			Result:="Nom<"+nom+"> ; Prenom<"+prenom+"> ; Identifiant<"+id+"> ; Adresse<"+adresse+"> ; DateNaissance<"+date_naiss+"> ; Admin<OUI>"
		end
end
