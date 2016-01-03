class MEDIA
	-- représente la classe d'un media

creation {ANY}
	make, set_id, set_titre, set_genre, set_nb_exemplaires, set_date

feature {ANY}
	id: STRING
		-- id du média
	titre: STRING
		-- titre du média
	genre: STRING
		-- genre du média (thriller, SF...)
	nb_exemplaires: INTEGER
		-- nombre d'exemplaires du média
	date: STRING
		-- date de sorti du média d'origine

feature {ANY}
	--constructeur de la classe
	make(new_id: STRING; new_titre: STRING; new_genre: STRING; new_nb_exemplaires: INTEGER; new_date: STRING)is
		do
			id:=new_id
			titre:=new_titre
			genre:=new_genre
			nb_exemplaires:=new_nb_exemplaires
			date:=new_date
		end

	--Les setteurs de la classe
	set_id (new_id: STRING) is
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

	-- diminue le nbExemplaire de 1 lors d'un emprunt
	diminuer_exemplaires is	
		do
			nb_exemplaires := nb_exemplaires - 1
		end

	-- augmente le nbExemplaires de 1 lors d'un retour d'emprunt
	augmenter_exemplaires is	
		do
			nb_exemplaires := nb_exemplaires + 1
		end
	
	--getter de la classe	
        get_titre: STRING is
                do
                         Result:=titre
                end
        get_id : STRING is
		do
			Result:=id
		end
end
	
