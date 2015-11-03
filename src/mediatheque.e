class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT; dvd1: DVD; livre1: LIVRE

feature {ANY}
	main is
	
		do
			io.put_string("Bienvenue dans le programme MEDIATHEQUE BTKE")
			io.flush

			create adherent1.make("1", "Smith", "John", "789 rue Paul Menard 56000 Vannes", "26/01/1989")
			adherent1.affichage_test

			create dvd1.make("1", "Inception", "Thriller", 4, "2010", "Christopher Nolan", "Leonardo DiCaprio", "Simple")
			dvd1.affichage_test

			create livre1.make("1", "Les Nymphéas Noirs", "Thriller/policier", 4, "2012", "Michel Bussi", 320)
			livre1.affichage_test
		end

end
