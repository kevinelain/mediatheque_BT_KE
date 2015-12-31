class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT; dvd1: DVD; livre1: LIVRE; personnel1: PERSONNEL; final_test:BOOLEAN
	x: INTEGER; choix_menu: INTEGER; test:STRING; adh_db: TEXT_FILE_READ; med_db: TEXT_FILE_READ;
       les_dvds: ARRAY[DVD]; les_livres: ARRAY[LIVRE]; les_emprunts: ARRAY[EMPRUNT]; les_adherents: ARRAY[ADHERENT]; les_personnels: ARRAY[PERSONNEL]
        
feature {ANY}
	main is
	
		do
			instance_test
					

			from
				x:=0
			until
				final_test
			loop
				adh_db.read_line
				if not(adh_db.end_of_input)
                            	then
			              creation_adh_with_file(adh_db.last_string)
                            	end
                            	final_test:=adh_db.end_of_input		
			end
			adh_db.disconnect

			final_test:=med_db.end_of_input
			from
				x:=0
			until
				final_test
			loop
				med_db.read_line
				if not (med_db.end_of_input)
				then
			              creation_med_with_file(med_db.last_string)
				end
				final_test:=med_db.end_of_input
			end
			med_db.disconnect
			from
			  x:=1
			 until
			  x = les_livres.count+1
			 loop
				io.put_string("%N"+les_livres.item(x).get_titre)
				x:=x+1
			end
			from
 			 x:=1
			 until
			  x = les_dvds.count+1
			 loop
				les_dvds.item(x).affichage_test
				x:=x+1
			end
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
		  choix_menu_per: INTEGER; temp:STRING; i: INTEGER; adh_db2: TEXT_FILE_READ
		 do
			choix_menu_per:=0
			
			from 
			until
			        choix_menu_per=12
			loop
				io.put_string("--------------------------------------------------------%N")
			       io.put_string("|  taper 1 pour rechercher un DVD	                    |%N")
		              io.put_string("|  taper 2 pour rechercher un Livre	              |%N")
		              io.put_string("|  taper 3 pour enregistrer un emprunt	              |%N")
				io.put_string("|  taper 4 pour rendre emprunt		              |%N")
				io.put_string("|  taper 5 pour consulter les emprunt 	              |%N")
				io.put_string("|  taper 6 pour ajouter un nouvel adhérent	       |%N")
				io.put_string("|  taper 7 pour ajouter un nouveau membre du personnel	|%N")
				io.put_string("|  taper 8 pour ajouter des membres via un fichier       |%N")
				io.put_string("|  taper 9 pour voir tous les membres		        |%N")
				io.put_string("|  taper 10 pour ajouter un media		        |%N")
				io.put_string("|  taper 11 pour ajouter des media via un fichier        |%N")
				io.put_string("|  taper 12 revenir au menu précédent 	              |%N")
				io.put_string("--------------------------------------------------------%N")
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
				elseif (choix_menu_per=8)
			        then
			        	temp:=""
					io.read_line
                                	io.put_string("Pour utiliser un fichier, mettez le fichier dans le dossier qui contient l'executable%N")				
					io.put_string("donner le nom du fichier, par exemple: membre.txt %N")
					io.read_line					
					temp.copy(io.last_string)
					create adh_db2.make
					adh_db2.connect_to(temp)
					final_test:=adh_db2.end_of_input
					from
						i:=0
					until
						final_test
					loop
						adh_db2.read_line
                            			if not(adh_db2.end_of_input)
						then
							creation_adh_with_file(adh_db2.last_string)
						end
						final_test:=adh_db2.end_of_input
						i:=i+1		
					end
					adh_db2.disconnect
				elseif (choix_menu_per=9)
				then
					io.read_line
					io.put_string("Nom des adhérents %N")
			 		from
			  			i:=1
			 		until
			  			i = les_adherents.count+1
			 		loop
			 			les_adherents.item(i).affichage_test
			 			i:=i+1
			 		end	
			 		io.put_string("%N Nom du membre du personnel %N")
					from
			  			i:=1
			 		until
			  			i = les_personnels.count+1
			 		loop
			 			les_personnels.item(i).affichage_test
			 			i:=i+1
			 		end		 		
			        elseif (choix_menu_per=12)
			        then
                                	choix_menu:=98
			        end
			end

		 end


		instance_test is
		 do
			create adh_db.make
			adh_db.connect_to("inscrit.txt")
			create med_db.make
			med_db.connect_to("medias.txt")
			
			create les_dvds.with_capacity(0,1)
			create les_livres.with_capacity(0,1)
			create les_emprunts.with_capacity(0,1)     
                     	create les_adherents.with_capacity(0,1)
                     	create les_personnels.with_capacity(0,1)
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
		
		
		creation_adh_with_file(phrase: STRING)is
		local
			tab:ARRAY[STRING]; adh:ADHERENT; pers:PERSONNEL
                     	itab:INTEGER
                     	bool_naiss:BOOLEAN; bool_admin:BOOLEAN
			attribut: STRING
		do
		
			create tab.with_capacity(0,1)
                     create adh.make ("","","","","")
                     create pers.make ("","","","","","")
			attribut:=""
                     bool_naiss:=False
                     bool_admin:=False
                     phrase.replace_all('<',' ')
                     phrase.replace_all('>',' ')
                     phrase.replace_all(';',' ')
                     tab:=phrase.split
			     from
				itab:=1
			     until
				itab = tab.count+1
			     loop
				if (tab.item(itab).is_equal("Nom"))
                            	then
                                	itab:=itab+1
                               		adh.set_nom(tab.item(itab))
                                	pers.set_nom(tab.item(itab))
                           	 elseif (tab.item(itab).is_equal("Prenom"))
                           	 then
                                	itab:=itab+1
                               		adh.set_prenom(tab.item(itab))
                              		pers.set_prenom(tab.item(itab))
                         	 elseif (tab.item(itab).is_equal("Identifiant"))
                           	 then
                                	itab:=itab+1
                             		adh.set_id(tab.item(itab))
                                	pers.set_id(tab.item(itab))
                            	elseif (tab.item(itab).is_equal("Adresse"))
                            	then
                                	itab:=itab+1
                                	adh.set_adresse(tab.item(itab))
                                	pers.set_adresse(tab.item(itab))
                            	elseif (tab.item(itab).is_equal("DateNaissance"))
                            	then
		                        itab:=itab+1
		                        adh.set_date_naiss(tab.item(itab))
		                        pers.set_date_naiss(tab.item(itab))
		                        bool_naiss:=True
		                elseif (tab.item(itab).is_equal("Admin"))
		                then
		                        bool_admin:=True
                            	end
                            itab:=itab+1
		        end
                     if (bool_naiss=False)
                     then
                        adh.set_date_naiss("00/00/0000")
                        pers.set_date_naiss("00/00/0000")    
                     end
                     if (bool_admin=True)
                     then
                        pers.set_matricule(pers.get_nom+pers.get_id)
                        les_personnels.add_last(pers)                         
                     else
                        les_adherents.add_last(adh)
                     end  
		end		

		creation_med_with_file(phrase: STRING)is
		local
			tab:ARRAY[STRING]; dvd:DVD; livre: LIVRE
                     	itab:INTEGER
                     	bool_livre:BOOLEAN; bool_id:BOOLEAN;
			attribut: STRING
		do
			create tab.with_capacity(0,1)
			create dvd.make ("","","null",1,"00/00/0000","","Simple")
			create livre.make ("","","null",1,"00/00/0000","",0)
			attribut:=""
			bool_livre:=False; 
			bool_id:=False;
			phrase.replace_all('<',' ')
			phrase.replace_all('>',' ')
			phrase.replace_all(';',' ')
			tab:=phrase.split
			from
				itab:=1
			until
				itab = tab.count+1
			loop
				if (tab.item(itab).is_equal("Livre"))
                            	then
                                	bool_livre:=True
                                elseif (tab.item(itab).is_equal("Identifiant"))
				then
                                	itab:=itab+1
                               		dvd.set_titre(tab.item(itab))
                              		livre.set_titre(tab.item(itab))
                              		bool_id:=True
				elseif (tab.item(itab).is_equal("Titre"))
				then
                                	itab:=itab+1
                               		dvd.set_titre(tab.item(itab))
                              		livre.set_titre(tab.item(itab))
				elseif (tab.item(itab).is_equal("Auteur"))
				then
                                	itab:=itab+1
                             		livre.set_auteur(tab.item(itab))
				elseif (tab.item(itab).is_equal("Nombre"))
				then
                                	itab:=itab+1
                               		dvd.set_titre(tab.item(itab))
                              		livre.set_titre(tab.item(itab))
				elseif (tab.item(itab).is_equal("Annee"))
				then
		                        itab:=itab+1
		                        dvd.set_titre(tab.item(itab))
                              		livre.set_titre(tab.item(itab))
				elseif (tab.item(itab).is_equal("Genre"))
				then
		                        itab:=itab+1
		                        dvd.set_titre(tab.item(itab))
                              		livre.set_titre(tab.item(itab))
                              	elseif (tab.item(itab).is_equal("NombrePage"))
                              	then
                              		itab:=itab+1
                              		livre.set_nb_pages(tab.item(itab).to_integer)
                              	elseif (tab.item(itab).is_equal("Realisateur"))
                              	then
                              		itab:=itab+1
                              		dvd.set_realisateur(tab.item(itab))
                              	elseif (tab.item(itab).is_equal("Acteur"))
                              	then
                              		itab:=itab+1
                              		dvd.new_acteur(tab.item(itab))
                              	elseif (tab.item(itab).is_equal("Type"))
                              	then
                              		itab:=itab+1
                              		dvd.set_type(tab.item(itab))
				end
				itab:=itab+1
		        end
		     if (bool_id=False)
		     then
		     	dvd.set_id(dvd.get_titre+"dvd"+dvd.get_type)
			livre.set_id(livre.get_titre+"livre")
		     end
                     if (bool_livre=True)
                     then
                        les_livres.add_last(livre)                         
                     else
                        les_dvds.add_last(dvd)
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
