class DVD
	-- représente la classe d'un DVD
inherit MEDIA
	rename make as make_media
	end

creation {ANY}
	make, set_realisateur, set_acteurs, set_type

feature {ANY}
	realisateur: STRING
		-- realisateur du film
	acteurs: STRING		-- a changer dans le futur en tableau ARRAY[STRING]
		-- représente un tableau contenant les acteurs principaux
	type: STRING
		-- si le DVD est simple, en coffret, double...

feature {ANY}
	make(new_id: STRING; new_titre: STRING; new_genre: STRING; new_nb_exemplaires: INTEGER; new_date: STRING; new_realisateur: STRING; new_acteurs: STRING; new_type: STRING)is
		do
			make_media(new_id, new_titre, new_genre, new_nb_exemplaires, new_date)
			realisateur := new_realisateur
			acteurs := new_acteurs
			type := new_type			
		end

	set_realisateur (new_realisateur: STRING) is
		require

		local

		do
			realisateur := new_realisateur
		end

	set_acteurs(new_acteurs: STRING) is
		require
		local
		do
			acteurs := new_acteurs
		end
	
	set_type (new_type: STRING) is
		require

		local

		do
			type := new_type
		end
	
	--Fonction d'affichage test
	affichage_test is
		do
			io.put_string("%N"+id)
			io.put_string("%N"+titre)
			io.put_string("%N"+genre)
			io.put_string("%N")
			io.put_integer(nb_exemplaires)
			io.put_string("%N"+date)
			io.put_string("%N"+realisateur)
			io.put_string("%N"+acteurs)
			io.put_string("%N"+type)
		end


end
