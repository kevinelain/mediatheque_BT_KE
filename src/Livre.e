class LIVRE
	-- représente la classe d'un livre

creation {ANY}
	setAuteur, setNbPages

feature {}
	auteur: STRING
		-- auteur du livre
	nbPages: INTEGER
		-- nombre de pages du livre

feature {}

	setAuteur (newAuteur : STRING) is
		require

		local

		do
			auteur := newAuteur 
		end
	
	setNbPages (newNbPages: STRING) is
		require

		local

		do
			nbPages := newNbPages
		end

feature {MEDIA}
