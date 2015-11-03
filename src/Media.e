class MEDIA
	-- représente la classe d'un media

creation {ANY}
	set_id, set_titre, set_genre, set_nb_exemplaires, set_date

feature {}
	id: INTEGER
		-- id du média
	titre: STRING
		-- titre du média
	genre: INTEGER
		-- genre du média (thriller, SF...)
	nb_exemplaires: INTEGER
		-- nombre d'exemplaires du média
	date: STRING
		-- date de sorti du média d'origine

feature {}
	set_id (new_id: INTEGER) is
		do
			id := new_id
		end

	set_titre (new_titre: STRING) is
		do
			titre := new_titre
		end

	set_genre(new_genre: STRING) is
		do
			genre := new_genre
		end

	set_nb_exemplaires(new_nb_exemplaires: INTEGER) is
		do
			nb_exemplaires := new_nb_exemplaires
		end

	set_date(new_date: STRING) is
		do
			date := new_date
		end

	diminuer_exemplaires() is	-- diminue le nbExemplaire de 1 lors d'un emprunt
		do
			nb_exemplaires := nb_exemplaires - 1
		end

	augmenter_exemplaires() is	-- augmente le nbExemplaires de 1 lors d'un retour d'emprunt
		do
			nb_exemplaires := nb_exemplaires + 1
		end

feature {}
	
end
	
