class LIVRE
	-- représente la classe d'un livre

creation {ANY}
	set_auteur, set_nb_pages

feature {}
	auteur: STRING
		-- auteur du livre
	nb_pages: INTEGER
		-- nombre de pages du livre

feature {}

	set_auteur (new_auteur : STRING) is
		require

		local

		do
			auteur := new_auteur 
		end
	
	set_nb_pages (new_nb_pages: STRING) is
		require

		local

		do
			nb_pages := new_nb_pages
		end

feature {MEDIA}

end
