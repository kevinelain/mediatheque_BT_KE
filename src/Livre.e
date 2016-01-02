class LIVRE
	-- représente la classe d'un livre
inherit MEDIA
	rename make as make_media
	end

creation {ANY}
	make, set_auteur, set_nb_pages

feature {ANY}
	auteur: STRING
		-- auteur du livre
	nb_pages: INTEGER
		-- nombre de pages du livre

feature {ANY}
	--constructeur de la classe
	make(new_id: STRING; new_titre: STRING; new_genre: STRING; new_nb_exemplaires: INTEGER; new_date: STRING; new_auteur: STRING; new_nb_pages: INTEGER)is
		do
			make_media(new_id, new_titre, new_genre, new_nb_exemplaires, new_date)
			auteur := new_auteur
			nb_pages := new_nb_pages
		end

	--Les setteurs de la classe
	set_auteur (new_auteur : STRING) is
		require

		local

		do
			auteur := new_auteur 
		end
	
	set_nb_pages (new_nb_pages: INTEGER) is
		require

		local

		do
			nb_pages := new_nb_pages
		end

	--On affiche les informations du livre
	affichage_test is
		do
			io.put_string("%N identifiant: "+id)
			io.put_string("%N titre du livre: "+titre)
			io.put_string("%N genre du livre: "+genre)
			io.put_string("%N nombre d'exemplaire: ")
			io.put_integer(nb_exemplaires)
			io.put_string("%N date de sortie: "+date)
			io.put_string("%N Auteur: "+auteur)
			io.put_string("%N Nombre de page: ")
			io.put_integer(nb_pages)
			io.put_string("%N")
		end
		
	--getter de la classe
	get_text_file : STRING is
		do
			Result:="Livre ; Identifiant<"+id+"> ; Titre<"+titre+"> ; Genre<"+genre+"> ; Nombre<"+nb_exemplaires.to_string+"> ; Annee<"+date+"> ; Auteur<"+auteur+"> ; NombrePage<"+nb_pages.to_string+">"
		end

end
