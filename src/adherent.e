class ADHERENT

creation {ANY}
	make, set_nom, set_prenom, set_adresse

feature {ANY}
			id: INTEGER
			nom: STRING
			prenom: STRING
			adresse: STRING
			date_naiss: STRING

feature{ANY}
	--constructeur de la classe
	make(new_id: INTEGER; new_nom: STRING; new_prenom: STRING; new_adresse: STRING; new_date_naiss: STRING)is
		do
			id:=new_id
			nom:=new_nom
			--io.put_string("%N"+nom)
			prenom:=new_prenom
			adresse:=new_adresse
			date_naiss:=new_date_naiss
		end
	
--Les setteurs de la classe

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
		
			--Fonction d'affichage test
	affichage_test is
		do
			io.put_string("%N")
			io.put_integer(id)
			io.put_string("%N"+nom)
			io.put_string("%N"+prenom)
			io.put_string("%N"+adresse)
			io.put_string("%N"+date_naiss)
		end
			
	
			
end