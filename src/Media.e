class MEDIA
	-- représente la classe d'un media

creation {ANY}
	setId, setTitre, setGenre, setNbExemplaires, setDate

feature {}
	id: INTEGER
		-- id du média
	titre: STRING
		-- titre du média
	genre: INTEGER
		-- genre du média (thriller, SF...)
	nbExemplaires: INTEGER
		-- nombre d'exemplaires du média
	date: STRING
		-- date de sorti du média d'origine

feature {}
	setId (newId: INTEGER) is
		do
			id := newId
		end

	setTitre (newTitre: STRING) is
		do
			titre := newTitre
		end

	setGenre(newGenre: STRING) is
		do
			genre := newGenre
		end

	setNbExemplaires(newNbExemplaires: INTEGER) is
		do
			nbExemplaires := newNbExemplaires
		end

	setDate(newDate: STRING) is
		do
			date := newDate
		end

	diminuerExemplaires() is	-- diminue le nbExemplaire de 1 lors d'un emprunt
		do
			nbExemplaires := nbExemplaires - 1
		end

	augmenterExemplaires() is	-- augmente le nbExemplaires de 1 lors d'un retour d'emprunt
		do
			nbExemplaires := nbExemplaires + 1
		end

feature {}
	

	
