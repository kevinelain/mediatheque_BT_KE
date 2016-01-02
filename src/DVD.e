class DVD
	-- représente la classe d'un DVD
inherit MEDIA
	rename make as make_media
	end

creation {ANY}
	make, set_realisateur, set_type

feature {ANY}
	realisateur: STRING
		-- realisateur du film
	acteurs: ARRAY[STRING]
		-- représente un tableau contenant les acteurs principaux
	type: STRING
		-- si le DVD est simple, en coffret, double...

feature {ANY}
	--constructeur de la classe
	make(new_id: STRING; new_titre: STRING; new_genre: STRING; new_nb_exemplaires: INTEGER; new_date: STRING; new_realisateur: STRING; new_type: STRING)is
		do
			make_media(new_id, new_titre, new_genre, new_nb_exemplaires, new_date)
			realisateur := new_realisateur
			create acteurs.with_capacity(0,1)
			type := new_type			
		end

	--Les setteurs de la classe
	set_realisateur (new_realisateur: STRING) is
		require

		local

		do
			realisateur := new_realisateur
		end
	
	set_type (new_type: STRING) is
		require

		local

		do
			type := new_type
		end
		
	-- fonction qui va ajouter un nouvel acteur dans le tableau des acteurs qui jouent dans le film/documentaire
	new_acteur(new_acteurs: STRING) is
		require
		
		local
		do
			acteurs.add_last(new_acteurs)
		end
		
	--getter de la classe
	get_type : STRING is
		do
                         Result:=type
                end
               
        get_text_file : STRING is
		local
			text: STRING; x: INTEGER
		do
			text:="DVD ; Identifiant<"+id+"> ; Titre<"+titre+"> ; Genre<"+genre+"> ; Nombre<"+nb_exemplaires.to_string+"> ; Annee<"+date+"> ; Realisateur<"+realisateur+"> ; "
			from
				x:=1
			until
				x=acteurs.count+1
			loop
				text:=text+"Acteur<"+acteurs.item(x)+"> ; "
				x:=x+1
			end
			text:=text+"Type<"+type+">"
			Result:=text
		end
	
	--On affiche les informations du dvd
	affichage_test is
		local
			x: INTEGER
		do
			io.put_string("%N identifiant: "+id)
			io.put_string("%N titre du film: "+titre)
			io.put_string("%N genre du film: "+genre)
			io.put_string("%N nombre d'exemplaire: ")
			io.put_integer(nb_exemplaires)
			io.put_string("%N date de sortie: "+date)
			io.put_string("%N realisateur: "+realisateur)
			from
				x:=1
			until
				x=acteurs.count+1
			loop
				io.put_string("%N acteur: "+acteurs.item(x))
				x:=x+1
			end
			io.put_string("%N type du DVD"+type+"%N")
		end
end
