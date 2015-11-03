class LIVRE
	-- représente la classe d'un livre
inherit MEDIA
	rename make as make_media

creation {ANY}
	make, set_auteur, set_nb_pages

feature {}
	auteur: STRING
		-- auteur du livre
	nb_pages: INTEGER
		-- nombre de pages du livre

feature {}
	--constructeur de la classe
	make(new_id: INTEGER, new_titre: STRING, new_genre: STRING, new_nb_exemplaires: STRING, new_date: STRING, new_auteur: STRING, new_nb_pages: INTEGER)is
		do
			make_media(new_id, new_titre, new_genre, new_nb_exemplaires, new_date)
			auteur := new_auteur
			nb_pages := new_nb_pages
		end

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
