class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT; dvd1: DVD; livre1: LIVRE; personnel1: PERSONNEL
	x: INTEGER; choix_menu: INTEGER; test:STRING; adh_db: TEXT_FILE_READ
        les_dvds: ARRAY[DVD]; les_livres: ARRAY[LIVRE]; les_emprunts: ARRAY[EMPRUNT]; les_adherents: ARRAY[ADHERENT]
        
feature {ANY}
	main is
	
		do
			instance_test
						
			io.put_string("Bienvenue dans le programme MEDIATHEQUE BTKE%N")
			io.put_string("Etes-vous un adhérent(taper 1) ou un membre du personnel (taper 2)?%N")
			io.put_string("Sinon taper 99 pour quitter%N")
			io.put_string("----------------------------------------------------------------------%N")
			io.flush
			io.read_integer
			choix_menu:=io.last_integer
			
			from 
			until
			        
			        choix_menu=99
			loop
				 from
				 until
				  choix_menu=1 or choix_menu=2 or choix_menu=99
				 loop
			          io.put_string("taper 1 si vous êtes adhérent ou 2 si vous êtes un membre du personnel%N")
				  io.put_string("Sinon taper 99 pour quitter%N")
				  io.put_string("----------------------------------------------------------------------%N")
			          io.read_integer
				  choix_menu:=io.last_integer
			         end

                                 if (choix_menu=1)
                                 then
                                  menu_adh
                                 elseif (choix_menu=2)
                                 then
                                  menu_personnel
			         end
			end
			if (choix_menu=99)
			then
			        io.put_string("Bonne journée%N")
			end
			from
				x:=0
			until
				adh_db.end_of_input
			loop
				adh_db.read_line
			        creation_adh(adh_db.last_string)		
			end
			adh_db.disconnect
			
		end
		
		menu_adh is
		 local
		  choix_menu_adh: INTEGER
		 do
			choix_menu_adh:=0
			
			from 
			until
			        
			        choix_menu_adh=4
			loop
				io.put_string("-----------------------------------------%N")
			        io.put_string("|  taper 1 pour rechercher un DVD	|%N")
		                io.put_string("|  taper 2 pour rechercher un Livre	|%N")
		                io.put_string("|  taper 3 pour consulter vos emprunts   |%N")
		                io.put_string("|  taper 4 revenir au menu précédent	|%N")
				io.put_string("-----------------------------------------%N")
		                io.flush
			        io.read_integer
				choix_menu_adh:=io.last_integer
                        	if (choix_menu_adh=1)
                         	then
                			io.read_line
                                	recherche_dvd
                        	elseif (choix_menu_adh=2)
                         	then
					io.read_line
                                	recherche_livre
                       		elseif (choix_menu_adh=3)
                        	 then
                                	io.read_line
					consulte_emprunt
				elseif (choix_menu_adh=4)
                        	 then
                                	choix_menu:=98
                        	end
			
			end


		end
		
		menu_personnel is
		 local
		  choix_menu_per: INTEGER
		 do
			choix_menu_per:=0
			
			from 
			until
			        choix_menu_per=6
			loop
				io.put_string("-----------------------------------------%N")
			        io.put_string("|  taper 1 pour rechercher un DVD	|%N")
		                io.put_string("|  taper 2 pour rechercher un Livre	|%N")
		                io.put_string("|  taper 3 pour enregistrer un emprunt	|%N")
				io.put_string("|  taper 4 pour rendre emprunt		|%N")
				io.put_string("|  taper 5 pour consulter les emprunt 	|%N")
				io.put_string("|  taper 6 revenir au menu précédent 	|%N")
				io.put_string("------------------------------------------%N")
		                io.flush
			        io.read_integer
			        choix_menu_per:=io.last_integer
			        if (choix_menu_per=1)
			        then
					io.read_line
                                	recherche_dvd
			        elseif (choix_menu_per=2)
			        then
					io.read_line
                                	recherche_livre
			        elseif (choix_menu_per=3)
			        then
					io.read_line
                                	enregistrer_emprunt
			        elseif (choix_menu_per=4)
			        then
					io.read_line
                                	rendre_emprunt
			        elseif (choix_menu_per=5)
			        then
					io.read_line
                                	consulte_emprunt
			        elseif (choix_menu_per=6)
			        then
                                	choix_menu:=98
			        end
			end

		 end


		instance_test is
		 do
		        create adh_db.make
			adh_db.connect_to("adherent.txt")
			
			create les_dvds.make(1,3)
			create les_livres.make(1,1)
			create les_emprunts.make(1,1)
			
			create adherent1.make("1", "Smith", "John", "789 rue Paul Menard 56000 Vannes", "26/01/1989")
			--adherent1.affichage_test
			
			create personnel1.make("1", "Smith", "John", "789 rue Paul Menard 56000 Vannes", "26/01/1989", "test")
			--personnel1.affichage_test

			create dvd1.make("dvd-1", "Inception", "Thriller", 4, "2010", "Christopher Nolan", "Leonardo DiCaprio", "Simple")
			les_dvds.put(dvd1,1)
			create dvd1.make("dvd-2", "Shutter Island", "Thriller", 4, "2010", "Martin Scorsese", "Leonardo DiCaprio", "Simple")
			les_dvds.put(dvd1,2)
			create dvd1.make("dvd-3", "OSS 117, Le Caire nid d'espions", "Thriller/Comédie", 4, "2006", "Michel Hazanavicius", "Jean Dujardin", "Simple")
			les_dvds.put(dvd1,3)


			create livre1.make("livre-1", "Les Nymphéas Noirs", "Thriller/policier", 4, "2012", "Michel Bussi", 320)
			les_livres.put(livre1,1)
		end   
		
		
		
		
                recherche_dvd is
                 local
                  bool:BOOLEAN
                  titre:STRING
                  i:INTEGER
                 do
			io.put_string("--------------------------------------%N")
                        io.put_string("Le titre du DVD que vous cherchez?%N")
			io.put_string("--------------------------------------%N")
                	io.read_line
                	titre:=io.last_string
                	bool:=False
                	 from
			  i:=1
			 until
			  i = les_dvds.count+1 or bool=True
			 loop
			  if les_dvds.item(i).get_titre.is_equal(titre)
			   then
			    bool:=True
			  else
			    i:=i+1
			  end
			 end 
			 if bool=True
			  then
			   les_dvds.item(i).affichage_test
			 else
			   io.put_string("---------------------------------------------------%N")
			   io.put_string("Nous n avons pas cet ouvrage dans notre médiathèque%N")
			   io.put_string("---------------------------------------------------%N")
			 end
		end
		
		
		recherche_livre is
		 local
                  bool:BOOLEAN
                  titre:STRING
                  i:INTEGER
                 do
			io.put_string("------------------------------------%N")
                        io.put_string("Le titre du Livre que vous cherchez?%N")
			io.put_string("------------------------------------%N")
                	io.read_line
                	titre:=io.last_string
                	bool:=False
                	 from
			  i:=1
			 until
			  i = les_livres.count+1 or bool=True
			 loop
			  if les_livres.item(i).get_titre.is_equal(titre)
			   then
			    bool:=True
			  else
			    i:=i+1
			  end
			 end 
			 if bool=True
			  then
			   les_livres.item(i).affichage_test
			 else
			   io.put_string("---------------------------------------------------%N")
			   io.put_string("Nous n avons pas cet ouvrage dans notre médiathèque%N")
			   io.put_string("---------------------------------------------------%N")
			 end
		end
		
		
		creation_adh(phrase: STRING)is
		 local
			tab:ARRAY[STRING]
			i:INTEGER; j:INTEGER ;itab:INTEGER
			attribut: STRING
			bool:BOOLEAN
		do
			create tab.make(1,1)
			--io.put_string(phrase)
			attribut:=""
			 from
				i:=1
				j:=1
			until
				i = phrase.count+1
			loop
			        if phrase.item(i)='<'
				 then
					bool:=True
					i:=i+1
				elseif phrase.item(i) = '>'
				 then
					bool:=False
					tab.put(attribut,j)
					j:=j+1
					attribut:=""
				end
				if bool = True
				 then
					attribut:=attribut+phrase.item(i).to_string
				end
				i:=i+1
			end
			     from
				itab:=1
			     until
				itab = tab.count+1
			     loop
				io.put_string(tab.item(itab))
				io.put_string("%N")
				itab:=itab+1
		        end   
		end		
        
        
        
        	enregistrer_emprunt is
		 local
		  un_emprunt:EMPRUNT; reussi:BOOLEAN
		  id_media: STRING; id_adh: STRING; date_auj: STRING; date_ret: STRING
		 do
			io.put_string("---------------------------------------------------%N")
			io.put_string("L'id de l'adherent%N")
                	io.read_line
			id_adh:=""
			id_adh.copy(io.last_string)
			io.put_string("L'id du média%N")
                	io.read_line
			id_media:=""
                	id_media.copy(io.last_string)
			io.put_string("Date d'aujourd'hui (jj/mm/aa)%N")
                	io.read_line
			date_auj:=""
                	date_auj.copy(io.last_string)
			io.put_string("Date de retour prévu (jj/mm/aa)%N")
                	io.read_line
			date_ret:=""
                	date_ret.copy(io.last_string)
			create un_emprunt.make(id_media, id_adh, date_auj, date_ret, "00/00/00")
			les_emprunts.put(un_emprunt,1)
			reussi:=diminuer_exemplaire_media(id_media)
			if reussi=True
			then
			 io.put_string("Enregistrement emprunt réussi%N")
			 io.put_string("-----------------------------------%N")
			else
			 io.put_string("Media introuvable, veuillez recommencer la manipulation%N")
			 io.put_string("----------------------------------------------------------%N")
			end
        	 end
               
        	consulte_emprunt is
		 local
		  id_adh: STRING; i:INTEGER
		 do
		  io.put_string("---------------------%N")
		  io.put_string("L'id de l'adherent%N")
                  io.read_line
		  id_adh:=io.last_string
		  from
			i:=1
		  until
			i = les_emprunts.count+1
		  loop
			if les_emprunts.item(i).get_id_adh.is_equal(id_adh)
			 then
				les_emprunts.item(i).affichage_test
				io.put_integer(i)
				io.put_string("---------------------%N")
				i:=i+1
			else
				i:=i+1
			end
		  end
        	end

		diminuer_exemplaire_media(id_media:STRING):BOOLEAN is
		 local
		  i:INTEGER; trouve:BOOLEAN
		 do
		  trouve:=False
		  from
		   i:=1
		  until
		   trouve=True or i=les_dvds.count+1
		  loop
		   if les_dvds.item(i).get_id.is_equal(id_media)
		   then
			les_dvds.item(i).diminuer_exemplaires
			trouve:=True
		   else
			i:=i+1
		   end
		  end
		  if (trouve=True)
		   then		
			Result:=trouve
		  else
			Result:=trouve
			from
		   		i:=1
			until
		   		trouve=True or i=les_dvds.count+1
			loop
				if les_livres.item(i).get_id.is_equal(id_media)
				then
					les_dvds.item(i).diminuer_exemplaires
					trouve:=True
				else
					i:=i+1
				end	
			end
			if (trouve=True)
		   	then		
				Result:=trouve
			else
				Result:=trouve
			end
		  end
		 end
        



		rendre_emprunt is
		 local
		  id_adh: STRING; id_media_emp: STRING; date_retour: STRING; reussi: BOOLEAN; i: INTEGER
		 do
		  io.put_string("-----------------------------%N")
		  io.put_string("L'id de l'adherent%N")
                  io.read_line
                  id_adh:=""
                  id_adh.copy(io.last_string)
                  io.put_string("L'id du média%N")
                  io.read_line
                  id_media_emp:=""
                  id_media_emp.copy(io.last_string)
                  io.put_string("Date du jour%N")
                  io.read_line
                  date_retour:=""
                  date_retour.copy(io.last_string)
		  reussi:=False
		  from
		   i:=1
		  until
		   reussi=True or i=les_emprunts.count+1
		  loop
		   if les_emprunts.item(i).get_id_adh.is_equal(id_adh) and les_emprunts.item(i).get_id_media.is_equal(id_media_emp)
		   then
			reussi:=augmenter_exemplaire_media(les_emprunts.item(i).get_id_media)
			les_emprunts.item(i).set_date_retour_r(date_retour);
		   else
			i:=i+1
		   end
		  end
		  if reussi=True
		  then
			io.put_string("Retour emprunt réussi%N")
			io.put_string("-------------------------%N")
		  else
			 io.put_string("Retour impossible, veuillez recommencer la manipulation%N")
			 io.put_string("-----------------------------------------------------------%N")
		  end
		 end

		augmenter_exemplaire_media(id_media:STRING):BOOLEAN is
		 local
		  i:INTEGER; trouve:BOOLEAN
		 do
		  trouve:=False
		  from
		   i:=1
		  until
		   trouve=True or i=les_dvds.count+1
		  loop
		   if les_dvds.item(i).get_id.is_equal(id_media)
		   then
			les_dvds.item(i).augmenter_exemplaires
			trouve:=True
		   else
			i:=i+1
		   end
		  end
		  if (trouve=True)
		   then		
			Result:=trouve
		  else
			Result:=trouve
			from
		   		i:=1
			until
		   		trouve=True or i=les_dvds.count+1
			loop
				if les_livres.item(i).get_id.is_equal(id_media)
				then
					les_dvds.item(i).augmenter_exemplaires
					trouve:=True
				else
					i:=i+1
				end	
			end
			if (trouve=True)
		   	then		
				Result:=trouve
			else
				Result:=trouve
			end
		  end
		 end




end
