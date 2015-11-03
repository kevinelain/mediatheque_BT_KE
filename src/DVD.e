class DVD
	-- représente la classe d'un DVD

creation {ANY}
	setRealisateur, setActeurs, setType

feature {}
	realisateur: STRING
		-- realisateur du film
	acteurs: ARRAY[STRING]
		-- représente un tableau contenant les acteurs principaux
	type: STRING
		-- si le DVD est simple, en coffret, double...

feature {}

	setRealisateur (newRealisateur: STRING) is
		require

		local

		do
			realisateur := newRealisateur
		end

	setActeurs() is
		require
		local
		do
		end
	
	setType (newType: STRING) is
		require

		local

		do
			type := newType
		end

feature {MEDIA}


