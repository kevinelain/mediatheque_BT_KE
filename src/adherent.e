class ADHERENT

creation {ANY}
	make, set_nom, set_prenom, set_adresse

feature {ANY}
			id: STRING
			nom: STRING
			prenom: STRING
			adresse: STRING
			date_naiss: STRING

feature{ANY}
	--constructeur de la classe
	make(new_id: STRING; new_nom: STRING; new_prenom: STRING; new_adresse: STRING; new_date_naiss: STRING)is
		do
			id:=new_id
			nom:=new_nom
			prenom:=new_prenom
			adresse:=new_adresse
			date_naiss:=new_date_naiss
		end
	
	--Les setteurs de la classe
	set_id(new_id: STRING)is
		do
                     id:=new_id
		end  

	set_nom(new_nom: STRING)is
		do
			nom:=new_nom
		end

	set_prenom(new_prenom: STRING)is
		do
			prenom:=new_prenom
		end

	set_adresse(new_adresse: STRING)is
		do
			adresse:=new_adresse
		end

	set_date_naiss(new_date_naiss: STRING)is
		do
			date_naiss:=new_date_naiss
		end	
		
	--On affiche les informations de l'adhérent
	affichage_test is
		do
			io.put_string("%N identifiant: "+id)
			io.put_string("%N nom: "+nom)
			io.put_string("%N prenom: "+prenom)
			io.put_string("%N adresse: "+adresse)
			io.put_string("%N date de naissance: "+date_naiss+"%N")
		end
	
	--On renvoie en string les informations à écrire sur le fichier
	get_text_file : STRING is
		do
			Result:="Nom<"+nom+"> ; Prenom<"+prenom+"> ; Identifiant<"+id+"> ; Adresse<"+adresse+"> ; DateNaissance<"+date_naiss+">"
		end
			
	--getter de la classe
	get_nom : STRING is
              do
                     Result:=nom
              end

	get_id : STRING is
              do
                     Result:=id
              end

	get_adresse : STRING is
              do
                     Result:=adresse
              end

	get_date_naiss : STRING is
              do
                     Result:=date_naiss
              end
			
end
