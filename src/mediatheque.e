class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT

feature {ANY}
	main is
	
		do
			io.put_string("Bienvenue dans le programme MEDIATHEQUE BTKE")
			io.flush

			create adherent1.make("1", "Smith", "John", "789 rue Paul Menard 56000 Vannes", "26/01/1989")
			adherent1.affichage_test
		end


end
