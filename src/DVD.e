class DVD
	-- représente la classe d'un DVD

creation {ANY}
	set_realisateur, set_acteurs, set_type

feature {}
	realisateur: STRING
		-- realisateur du film
	acteurs: ARRAY[STRING]
		-- représente un tableau contenant les acteurs principaux
	type: STRING
		-- si le DVD est simple, en coffret, double...

feature {}

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
