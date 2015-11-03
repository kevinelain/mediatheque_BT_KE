class ADHERENT

creation {ANY}
	make, SetId, SetNom, SetPrenom, SetAdresse

feature {ANY}
			id: INTEGER
			nom: STRING
			prenom: STRING
			adresse: STRING
			dateNaiss: STRING

feature{ANY}
	--constructeur de la classe
	make(newId: INTEGER, newNom: STRING, newPrenom: STRING, newAdresse: STRING, newDateNaiss: STRING)is
		do
			id:=newId
			nom:=newNom
			prenom:=newPrenom
			adresse:=newAdresse
			dateNaiss:=newDateNaiss
		end
	
--Les setteurs de la classe

	SetNom(newNom: STRING)is
		do
			nom:=newNom
		end

	SetPrenom(newPrenom: STRING)is
		do
			prenom:=newPrenom
		end

	SetAdresse(newAdresse: STRING)is
		do
			adresse:=newAdresse
		end

	SetDateNaiss(newDateNaiss: STRING)is
		do
			dateNaiss:=newDateNaiss
		end	
		
			--Fonction d'affichage test
	affichageTest()is
		do
			io.put_integer(id)
			io.put_string("%N<nom>")
			io.put_string("%N<prenom>")
			io.put_string("%N<adresse>")
			io.put_string("%N<dateNaiss>")
		end
			
	
			
end
