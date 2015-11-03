class DVD
	-- représente la classe d'un DVD
inherit MEDIA
	rename make as make_media

creation {ANY}
	make, set_realisateur, set_acteurs, set_type

feature {}
	realisateur: STRING
		-- realisateur du film
	acteurs: ARRAY[STRING]
		-- représente un tableau contenant les acteurs principaux
	type: STRING
		-- si le DVD est simple, en coffret, double...

feature {}
	make(new_id: INTEGER, new_titre: STRING, new_genre: STRING, new_nb_exemplaires: STRING, new_date: STRING, new_realisateur: STRING, new_acteurs: ARRAY[STRING], new_type: STRING)is
		do
			make_media(new_id, new_titre, new_genre, new_nb_exemplaires, new_date)
			realisateur := new_realisateur
			-- acteurs := new_acteurs
			type := new_type			
		end

	set_realisateur (new_realisateur: STRING) is
		require

		local

		do
			realisateur := new_realisateur
		end

	set_acteurs is
		require
		local
		do
		end
	
	set_type (new_type: STRING) is
		require

		local

		do
			type := new_type
		end

feature {MEDIA}

end
