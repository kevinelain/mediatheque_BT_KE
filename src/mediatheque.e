class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT; dvd1: DVD; livre1: LIVRE
	x: INTEGER; test:STRING; adh_db: TEXT_FILE_READ

feature {ANY}
	main is
	
		do
			create adh_db.make
			adh_db.connect_to("adherent.txt")			
			io.put_string("Bienvenue dans le programme MEDIATHEQUE BTKE")
			io.flush

			create adherent1.make("1", "Smith", "John", "789 rue Paul Menard 56000 Vannes", "26/01/1989")
			--adherent1.affichage_test

			create dvd1.make("1", "Inception", "Thriller", 4, "2010", "Christopher Nolan", "Leonardo DiCaprio", "Simple")
			--dvd1.affichage_test

			create livre1.make("1", "Les Nymphéas Noirs", "Thriller/policier", 4, "2012", "Michel Bussi", 320)
			--livre1.affichage_test

			from
				x:=0
			until
				adh_db.end_of_input
			loop
				adh_db.read_line
				io.put_string(adh_db.last_string)
			        --creation_adh(adh_db.last_string)		
			end
			adh_db.disconnect
			
		end
               
        end
