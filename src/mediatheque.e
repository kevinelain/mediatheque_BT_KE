class MEDIATHEQUE
	-- class principale MEDIATHEQUE

creation {ANY}
	main

feature {}
	adherent1: ADHERENT; dvd1: DVD; livre1: LIVRE; personnel1: PERSONNEL; final_test:BOOLEAN
	x: INTEGER; choix_menu: INTEGER; test:STRING; adh_db: TEXT_FILE_READ; med_db: TEXT_FILE_READ; emp_db: TEXT_FILE_READ;
	adh_write: TEXT_FILE_WRITE; med_write: TEXT_FILE_WRITE; emp_write: TEXT_FILE_WRITE;
	les_dvds: ARRAY[DVD]; les_livres: ARRAY[LIVRE]; les_emprunts: ARRAY[EMPRUNT]; les_adherents: ARRAY[ADHERENT]; les_personnels: ARRAY[PERSONNEL]
        
feature {ANY}
	main is
	
		do
			-- Appel de la fonction qui va initialisé les tableaux global du logiciel
			instance_test
					
			-- On récupère les adhérents du fichier global
			from
				x:=0
			until
				final_test
			loop
				adh_db.read_line
				if not(adh_db.end_of_input)
                            	then
  			              --on envoie à une fonction la phrase lu pour la traiter et enregistrer les informations dans les tableaux les_adherents et les_personnels 	
			              creation_adh_with_file(adh_db.last_string)
                            	end
                            	final_test:=adh_db.end_of_input		
			end
			adh_db.disconnect
			---- On récupère les médias du fichier global
			final_test:=med_db.end_of_input
			from
				x:=0
			until
				final_test
			loop
				med_db.read_line
				if not (med_db.end_of_input)
				then
				      --on envoie à une fonction la phrase lu pour la traiter et enregistrer les informations dans les tableaux les_livres et les_dvds
			              creation_med_with_file(med_db.last_string)
				end
				final_test:=med_db.end_of_input
			end
			med_db.disconnect
			---- On récupère les emprunts du fichier global
			final_test:=emp_db.end_of_input
			from
				x:=0
			until
				final_test
			loop
				emp_db.read_line
				if not (emp_db.end_of_input)
				then
				      --on envoie à une fonction la phrase lu pour la traiter et enregistrer les informations dans ls tableau les_emprunts
			              creation_emp_with_file(emp_db.last_string)
				end
				final_test:=emp_db.end_of_input
			end
			emp_db.disconnect
			--Menu générale
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
			-- Si on quitte le logiciel, on réécrit tout dans les fichiers globaux
			if (choix_menu=99)
			then
				
			        io.put_string("Bonne journée%N")
			        save_adh
			        save_med
			        save_emp
			end
			
		end
		
		-- Menu quand on est adhérent
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
		
		-- Menu quand on est membre du personnel
		menu_personnel is
		 local
		  choix_menu_per: INTEGER; temp, temps:STRING; i: INTEGER; adh_db2: TEXT_FILE_READ; tempb:BOOLEAN;
		 do
			choix_menu_per:=0
			
			from 
			until
			        choix_menu_per=14
			loop
				io.put_string("--------------------------------------------------------%N")
			       	io.put_string("|  taper 1 pour rechercher un DVD	                    |%N")
		              	io.put_string("|  taper 2 pour rechercher un Livre	              |%N")
		              	io.put_string("|  taper 3 pour enregistrer un emprunt	              |%N")
				io.put_string("|  taper 4 pour rendre un emprunt		              |%N")
				io.put_string("|  taper 5 pour consulter les emprunt 	              |%N")
				io.put_string("|  taper 6 pour ajouter un nouvel adhérent	       |%N")
				io.put_string("|  taper 7 pour ajouter un nouveau membre du personnel	|%N")
				io.put_string("|  taper 8 pour ajouter des membres via un fichier       |%N")
				io.put_string("|  taper 9 pour voir tous les membres		        |%N")
				io.put_string("|  taper 10 pour ajouter un livre		        |%N")
				io.put_string("|  taper 11 pour ajouter un dvd			        |%N")
				io.put_string("|  taper 12 pour ajouter des media via un fichier        |%N")
				io.put_string("|  taper 13 pour augmenter le nombre d'exemplaire d'un media|%N")
				io.put_string("|  taper 14 revenir au menu précédent 	              |%N")
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
                                elseif (choix_menu_per=6)
			        then
					io.read_line
					creer_adherent
				elseif (choix_menu_per=7)
			        then
					io.read_line
					creer_membre	
				elseif (choix_menu_per=8)
			        then
						
					create adh_db2.make
					temp:=""
					io.read_line
		                        io.put_string("Pour utiliser un fichier, mettez le fichier dans le dossier qui contient l'executable%N")				
					io.put_string("donner le nom du fichier, par exemple: membre.txt %N")
					io.read_line					
					temp.copy(io.last_string)
					adh_db2.connect_to(temp)
					-- boucle tant qu'on donne pas le bon nom de fichier
					from
					until 
						adh_db2.is_connected
					loop
						temp:=""
						io.read_line
		                        	io.put_string("Nom du fichier erroner%N")				
						io.put_string("donner le nom du fichier, par exemple: membre.txt %N")
						io.read_line					
						temp.copy(io.last_string)
						adh_db2.connect_to(temp)
					end
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
					io.put_string("-----------Nom des adhérents----------	%N")
			 		from
			  			i:=1
			 		until
			  			i = les_adherents.count+1
			 		loop
			 			les_adherents.item(i).affichage_test
			 			i:=i+1
			 		end	
			 		io.put_string("%N------Nom du membre du personnel------%N")
					from
			  			i:=1
			 		until
			  			i = les_personnels.count+1
			 		loop
			 			les_personnels.item(i).affichage_test
			 			i:=i+1
			 		end
			 	 elseif (choix_menu_per=10)
			        then
					io.read_line
					creer_livre
				elseif (choix_menu_per=11)
			        then
					io.read_line
					creer_dvd
			 	elseif (choix_menu_per=12)
			        then
					create adh_db2.make
					temp:=""
					io.read_line
                                	io.put_string("Pour utiliser un fichier, mettez le fichier dans le dossier qui contient l'executable%N")				
					io.put_string("donner le nom du fichier, par exemple: livre.txt %N")
					io.read_line					
					temp.copy(io.last_string)		
					adh_db2.connect_to(temp)
					-- boucle tant qu'on donne pas le bon nom de fichier
					from
					until 
						adh_db2.is_connected
					loop
						temp:=""
						io.read_line
		                        	io.put_string("Nom du fichier erroner%N")				
						io.put_string("donner le nom du fichier, par exemple: membre.txt %N")
						io.read_line					
						temp.copy(io.last_string)
						adh_db2.connect_to(temp)
					end
					final_test:=adh_db2.end_of_input
					from
						i:=0
					until
						final_test
					loop
						adh_db2.read_line
                            			if not(adh_db2.end_of_input)
						then
							creation_med_with_file(adh_db2.last_string)
						end
						final_test:=adh_db2.end_of_input
						i:=i+1		
					end
					adh_db2.disconnect		 		
			        elseif (choix_menu_per=13)
			        then
                                	io.read_line
                                	temp:=""
                                	temps:=""
                                	io.put_string("donner l'identifiant du media%N")
					io.read_line
					temp.copy(io.last_string)
					io.put_string("donner le nombre de nouveaux exemplaires%N")
					io.read_line
					temps.copy(io.last_string)
					tempb:=augmenter_exemplaire_media(temp, temps.to_integer)
					if (tempb=True)
					then
						io.put_string("Augmentation réussie%N")
					else
						io.put_string("Augmentation échouer veuilez recommencer (id media erroner)%N")
					end
			        elseif (choix_menu_per=14)
			        then
                                	choix_menu:=98
			        end
			end

		 end

		--fonction qui instancie les tableaux globaux ainsi que les lecteurs de fichier
		instance_test is
		 do
			create adh_db.make
			adh_db.connect_to("inscrit.txt")
			create med_db.make
			med_db.connect_to("document.txt")
			create emp_db.make
			emp_db.connect_to("emprunt.txt")
			create les_dvds.with_capacity(0,1)
			create les_livres.with_capacity(0,1)
			create les_emprunts.with_capacity(0,1)     
                     	create les_adherents.with_capacity(0,1)
                     	create les_personnels.with_capacity(0,1)
		end   
		
		
		
		--fonctionde recherche de dvd
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
		
		--fonctionde recherche de livre
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
		
		-- fonction qui va traiter la phrase afin de rentrer les informations sur les adhérents et les membres du personnel 
		creation_adh_with_file(phrase: STRING)is
		local
			tab:ARRAY[STRING]; adh:ADHERENT; pers:PERSONNEL
                     	itab:INTEGER
                     	bool_naiss:BOOLEAN; bool_admin:BOOLEAN
			attribut: STRING
		do
			-- création du tableau qui va contenir les informations
			create tab.with_capacity(0,1)
			create adh.make ("","","","","")
			create pers.make ("","","","","","")
			attribut:=""
			-- instanciation des flags sur les informations optionnels
  			bool_naiss:=False
  			bool_admin:=False
                     	-- on va remplacer certain caractères dans le string afin de les decomposer
			phrase.replace_all(' ','-')
			phrase.replace_all('<',' ')
			phrase.replace_all('>',' ')
			phrase.replace_all(';',' ')
			-- on enlève tous les espaces et on met les élèments dans le tableau tab
			tab:=phrase.split
				from
					itab:=1
				until
					itab = tab.count+1
				loop
					if (tab.item(itab).is_equal("Nom") or tab.item(itab).is_equal("-Nom") or tab.item(itab).is_equal("Nom-") or tab.item(itab).is_equal("-Nom-"))
                            		then
                                		itab:=itab+1
                                		attribut:=tab.item(itab)
                                		attribut.replace_all('-',' ')
                               			adh.set_nom(attribut)
                                		pers.set_nom(attribut)
					elseif (tab.item(itab).is_equal("Prenom") or tab.item(itab).is_equal("-Prenom") or tab.item(itab).is_equal("Prenom-") or tab.item(itab).is_equal("-Prenom-"))
                           	 	then
                                		itab:=itab+1
                                		attribut:=tab.item(itab)
                                		attribut.replace_all('-',' ')
                               			adh.set_prenom(attribut)
                              			pers.set_prenom(attribut)
                         	 	elseif (tab.item(itab).is_equal("Identifiant") or tab.item(itab).is_equal("-Identifiant") or tab.item(itab).is_equal("Identifiant-") or tab.item(itab).is_equal("-Identifiant-"))
                           	 	then
                                		itab:=itab+1
                                		attribut:=tab.item(itab)
                                		attribut.replace_all('-',' ')
                             			adh.set_id(attribut)
                                		pers.set_id(attribut)
                            		elseif (tab.item(itab).is_equal("Adresse") or tab.item(itab).is_equal("-Adresse") or tab.item(itab).is_equal("Adresse-") or tab.item(itab).is_equal("-Adresse-"))
                            		then
                                		itab:=itab+1
                                		attribut:=tab.item(itab)
                                		attribut.replace_all('-',' ')
                                		adh.set_adresse(attribut)
                                		pers.set_adresse(attribut)
                            		elseif (tab.item(itab).is_equal("DateNaissance") or tab.item(itab).is_equal("-DateNaissance") or tab.item(itab).is_equal("DateNaissance-") or tab.item(itab).is_equal("-DateNaissance-"))
                            		then
		                        	itab:=itab+1
		                        	attribut:=tab.item(itab)
                                		attribut.replace_all('-',' ')
		                        	adh.set_date_naiss(attribut)
		                        	pers.set_date_naiss(attribut)
		                        	bool_naiss:=True
		                	elseif (tab.item(itab).is_equal("Admin") or tab.item(itab).is_equal("-Admin") or tab.item(itab).is_equal("Admin-") or tab.item(itab).is_equal("-Admin-"))
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

		-- fonction qui va traiter la phrase afin de rentrer les informations sur les livres et les dvds
		creation_med_with_file(phrase: STRING)is
		local
			tab:ARRAY[STRING]; dvd:DVD; livre: LIVRE
                     	itab:INTEGER
                     	bool_livre:BOOLEAN; bool_id:BOOLEAN;
			attribut: STRING
		do
			-- création du tableau qui va contenir les informations
			create tab.with_capacity(0,1)
			create dvd.make ("","","null",1,"00/00/0000","","Simple")
			create livre.make ("","","null",1,"00/00/0000","",0)
			attribut:=""
			-- instanciation des flags sur les informations optionnels
			bool_livre:=False; 
			bool_id:=False;
			-- on va remplacer certain caractères dans le string afin de les decomposer
			phrase.replace_all(' ','-')
			phrase.replace_all('<',' ')
			phrase.replace_all('>',' ')
			phrase.replace_all(';',' ')
			-- on enlève tous les espaces et on met les élèments dans le tableau tab
			tab:=phrase.split
			from
				itab:=1
			until
				itab = tab.count+1
			loop
				if (tab.item(itab).is_equal("Livre-"))
                            	then
                                	bool_livre:=True
                                elseif (tab.item(itab).is_equal("Identifiant-") or tab.item(itab).is_equal("-Identifiant-") or tab.item(itab).is_equal("-Identifiant") or tab.item(itab).is_equal("Identifiant"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		dvd.set_id(attribut)
                              		livre.set_id(attribut)
                              		bool_id:=True
				elseif (tab.item(itab).is_equal("-Titre") or tab.item(itab).is_equal("-Titre-") or tab.item(itab).is_equal("Titre") or tab.item(itab).is_equal("Titre-"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		dvd.set_titre(attribut)
                              		livre.set_titre(attribut)
				elseif (tab.item(itab).is_equal("-Auteur") or tab.item(itab).is_equal("-Auteur-") or tab.item(itab).is_equal("Auteur-") or tab.item(itab).is_equal("Auteur"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                             		livre.set_auteur(attribut)
				elseif (tab.item(itab).is_equal("-Nombre") or tab.item(itab).is_equal("-Nombre-") or tab.item(itab).is_equal("Nombre-") or tab.item(itab).is_equal("Nombre"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		dvd.set_nb_exemplaires(attribut.to_integer)
                              		livre.set_nb_exemplaires(attribut.to_integer)
				elseif (tab.item(itab).is_equal("-Annee") or tab.item(itab).is_equal("-Annee-") or tab.item(itab).is_equal("Annee-") or tab.item(itab).is_equal("Annee"))
				then
		                        itab:=itab+1
		                        attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
		                        dvd.set_date(attribut)
                              		livre.set_date(attribut)
                              	
				elseif (tab.item(itab).is_equal("Genre-") or tab.item(itab).is_equal("-Genre-") or tab.item(itab).is_equal("-Genre") or tab.item(itab).is_equal("Genre"))
				then
		                        itab:=itab+1
		                        attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
		                        dvd.set_genre(attribut)
                              		livre.set_genre(attribut)
                              	elseif (tab.item(itab).is_equal("NombrePage-") or tab.item(itab).is_equal("-NombrePage-") or tab.item(itab).is_equal("-NombrePage") or tab.item(itab).is_equal("NombrePage"))
                              	then
                              		itab:=itab+1
                              		attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                              		livre.set_nb_pages(attribut.to_integer)
                              	elseif (tab.item(itab).is_equal("Realisateur-") or tab.item(itab).is_equal("-Realisateur-") or tab.item(itab).is_equal("-Realisateur") or tab.item(itab).is_equal("Realisateur"))
                              	then
                              		itab:=itab+1
                              		attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                              		dvd.set_realisateur(attribut)
                              	elseif (tab.item(itab).is_equal("Acteur-") or tab.item(itab).is_equal("-Acteur-") or tab.item(itab).is_equal("-Acteur") or tab.item(itab).is_equal("Acteur"))
                              	then
                              		itab:=itab+1
                              		attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                              		dvd.new_acteur(attribut)
                              	elseif (tab.item(itab).is_equal("-Type") or tab.item(itab).is_equal("-Type-") or tab.item(itab).is_equal("Type-") or tab.item(itab).is_equal("Type"))
                              	then
                              		itab:=itab+1
                              		attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                              		dvd.set_type(attribut)
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

		-- fonction qui va traiter la phrase afin de rentrer les informations sur les emprunts
		creation_emp_with_file(phrase: STRING)is
		local
			tab:ARRAY[STRING]; emprunt:EMPRUNT; 
                     	itab:INTEGER
			attribut: STRING
		do
			-- création du tableau qui va contenir les informations
			create tab.with_capacity(0,1)
			create emprunt.make ("","","","","")
			attribut:=""
			-- on va remplacer certain caractères dans le string afin de les decomposer
			phrase.replace_all(' ','-')
			phrase.replace_all('<',' ')
			phrase.replace_all('>',' ')
			phrase.replace_all(';',' ')
			-- on enlève tous les espaces et on met les élèments dans le tableau tab
			tab:=phrase.split
			from
				itab:=1
			until
				itab = tab.count+1
			loop
				if (tab.item(itab).is_equal("IdMedia-") or tab.item(itab).is_equal("-IdMedia-") or tab.item(itab).is_equal("-IdMedia") or tab.item(itab).is_equal("IdMedia"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		emprunt.set_id_media(attribut)
				elseif (tab.item(itab).is_equal("-IdAdh") or tab.item(itab).is_equal("-IdAdh-") or tab.item(itab).is_equal("IdAdh") or tab.item(itab).is_equal("IdAdh-"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		emprunt.set_id_adh(attribut)
				elseif (tab.item(itab).is_equal("-dateEmprunt") or tab.item(itab).is_equal("-dateEmprunt-") or tab.item(itab).is_equal("dateEmprunt-") or tab.item(itab).is_equal("dateEmprunt"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                             		emprunt.set_date_emprunt(attribut)
				elseif (tab.item(itab).is_equal("-dateRetourPrevu") or tab.item(itab).is_equal("-dateRetourPrevu-") or tab.item(itab).is_equal("dateRetourPrevu-") or tab.item(itab).is_equal("dateRetourPrevu"))
				then
                                	itab:=itab+1
                                	attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
                               		emprunt.set_date_prevu(attribut)
				elseif (tab.item(itab).is_equal("-dateRetourReel") or tab.item(itab).is_equal("-dateRetourReel-") or tab.item(itab).is_equal("dateRetourReel-") or tab.item(itab).is_equal("dateRetourReel"))
				then
		                        itab:=itab+1
		                        attribut:=tab.item(itab)
                                	attribut.replace_all('-',' ')
		                        emprunt.set_date_reel(attribut)
				end
				itab:=itab+1
		        end
		        les_emprunts.add_last(emprunt)
		end

		-- Fonction qui va vérifier si l'adhérent existe
		verif_adh(id_adh:STRING): BOOLEAN is
			local
				i:INTEGER; bool:BOOLEAN
			do
				bool:=False
                		from
					i:=1
				until
					i = les_adherents.count+1 or bool=True
				loop
					if les_adherents.item(i).get_id.is_equal(id_adh)
					then
						bool:=True
					else
						i:=i+1
					end
				end 
				Result:=bool
			end
		
		-- Fonction qui enregistre les emprunts
		enregistrer_emprunt is
			local
				un_emprunt:EMPRUNT; reussi, exist:BOOLEAN;
				id_media: STRING; id_adh: STRING; date_auj: STRING; date_ret: STRING
			do
				io.put_string("---------------------------------------------------%N")
				io.put_string("L'id de l'adherent%N")
                		io.read_line
				id_adh:=""
				id_adh.copy(io.last_string)
				exist:=verif_adh(id_adh)
	          		--Si on réussie à trouver l'adhérent on continue
                		if exist=True
                		then
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
		        		-- Si on réussie à diminuer le nombre d'exemplaire d'un media c'est qu'on peut enregistrer un emprunt
					reussi:=diminuer_exemplaire_media(id_media)
					if reussi=True
					then
						--on créer un emprunt
				 		create un_emprunt.make(id_media, id_adh, date_auj, date_ret, "00/00/00")
				 		les_emprunts.add_last(un_emprunt)
				 		io.put_string("Enregistrement emprunt réussi%N")
				 		io.put_string("-----------------------------------%N")
					else
				 		io.put_string("Media introuvable, veuillez recommencer la manipulation%N")
				 		io.put_string("----------------------------------------------------------%N")
					end
				else
					io.put_string("Adherent introuvable, veuillez recommencer la manipulation%N")
				 	io.put_string("----------------------------------------------------------%N")
				end
			end
               
                --fonction qui va créer un adhérent
		creer_adherent is
        	local
        		adh:ADHERENT
			id_adh, nom_adh, prenom_adh, adr_adh, date_adh, first_caract, nom_lower: STRING; 
        	do
        		io.put_string("---------------------------------------------------%N")
			io.put_string("Insertion des informations du nouvel adhérent%N")
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nom%N")
                	io.read_line
			nom_adh:=""
			nom_adh.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le prénom%N")
                	io.read_line
			prenom_adh:=""
			prenom_adh.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer l'adresse%N")
                	io.read_line
			adr_adh:=""
			adr_adh.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer la date de naissance%N")
                	io.read_line
			date_adh:=""
			date_adh.copy(io.last_string)
			first_caract:=prenom_adh.item(1).to_string
			first_caract:=first_caract.as_lower
			nom_lower:=nom_adh.as_lower
			id_adh:=first_caract+nom_lower
			create adh.make (id_adh,nom_adh,prenom_adh,adr_adh,date_adh)
			les_adherents.add_last(adh)
		end
               
                --fonction qui va créer un membre du personnel
               	creer_membre is
		local
        		mem:PERSONNEL
			id_mem, nom_mem, prenom_mem, adr_mem, date_mem, mat_mem, first_caract, nom_lower: STRING; 
        	do
        		io.put_string("---------------------------------------------------%N")
			io.put_string("Insertion des informations du nouveau membre du personnel%N")
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nom%N")
                	io.read_line
			nom_mem:=""
			nom_mem.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le prénom%N")
                	io.read_line
			prenom_mem:=""
			prenom_mem.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer l'adresse%N")
                	io.read_line
			adr_mem:=""
			adr_mem.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer la date de naissance%N")
                	io.read_line
			date_mem:=""
			date_mem.copy(io.last_string)
			first_caract:=prenom_mem.item(1).to_string
			first_caract:=first_caract.as_lower
			nom_lower:=nom_mem.as_lower
			id_mem:=first_caract+nom_lower
			mat_mem:=nom_mem+id_mem
			create mem.make (id_mem,nom_mem,prenom_mem,adr_mem,date_mem,mat_mem)
			les_personnels.add_last(mem)
		end
               
               	--fonction qui va créer un livre
               	creer_livre is
        	local
        		livre:LIVRE
			id, titre, genre, auteur, date, temp: STRING; nb_exemplaires, nb_pages:INTEGER
        	do
        		io.put_string("---------------------------------------------------%N")
			io.put_string("Insertion des informations du nouveau livre%N")
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le titre%N")
                	io.read_line
			titre:=""
			titre.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le genre%N")
                	io.read_line
			genre:=""
			genre.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer la date de parution%N")
                	io.read_line
			date:=""
			date.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nom de l'auteur%N")
                	io.read_line
			auteur:=""
			auteur.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nombre exemplaire de ce livre%N")
                	io.read_line
			temp:=""
			temp.copy(io.last_string)
			nb_exemplaires:=temp.to_integer
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nombre de page du livre%N")
                	io.read_line
			temp:=""
			temp.copy(io.last_string)
			nb_pages:=temp.to_integer
			id:=titre+"livre"
			create livre.make (id,titre,genre,nb_exemplaires,date,auteur,nb_pages)
			les_livres.add_last(livre)
		end
               
		--fonction qui va créer un dvd
             	creer_dvd is
        	local
        		dvd:DVD
			id, titre, genre, realisateur, date, temp, type: STRING; nb_exemplaires:INTEGER
        	do
        		io.put_string("---------------------------------------------------%N")
			io.put_string("Insertion des informations du nouveau livre%N")
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le titre%N")
                	io.read_line
			titre:=""
			titre.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le genre%N")
                	io.read_line
			genre:=""
			genre.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer la date de parution%N")
                	io.read_line
			date:=""
			date.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nom du réalisateur%N")
                	io.read_line
			realisateur:=""
			realisateur.copy(io.last_string)
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le nombre exemplaire de ce dvd%N")
                	io.read_line
			temp:=""
			temp.copy(io.last_string)
			nb_exemplaires:=temp.to_integer
			io.put_string("---------------------------------------------------%N")
			io.put_string("Rentrer le type du dvd (Simple, Coffret)%N")
                	io.read_line
			type:=""
			type.copy(io.last_string)
			id:=titre+"dvd"+type
			create dvd.make (id,titre,genre,nb_exemplaires,date,realisateur,type)
			les_dvds.add_last(dvd)
		end
               
                -- Fonction qui va afficher les informations sur les emprunts non rendu d'un adhérent
        	consulte_emprunt is
        	local
			id_adh: STRING; i:INTEGER; exist:BOOLEAN
        	do
		  	io.put_string("---------------------%N")
		  	io.put_string("L'id de l'adherent%N")
                  	io.read_line
		  	id_adh:=io.last_string
		  	exist:=verif_adh(id_adh)
	          	--Si on réussie à trouver l'adhérent on continue
                	if exist=True
                	then
			  	from
					i:=1
			 	until
					i = les_emprunts.count+1
			  	loop
					if les_emprunts.item(i).get_id_adh.is_equal(id_adh)
					then
						if (les_emprunts.item(i).get_date_retour_r.is_equal("00/00/00"))
				 		then
							les_emprunts.item(i).affichage_test
							io.put_string("---------------------%N")
						end
						i:=i+1
					else
						i:=i+1
					end
			  	end
			else
				io.put_string("Adherent introuvable, veuillez recommencer la manipulation%N")
				io.put_string("----------------------------------------------------------%N")
			end
        	end

		-- Fonction qui va diminuer le nombre d'exemplaire d'un media. Il renvoie true s'il y arrive sinon False
		diminuer_exemplaire_media(id_media:STRING):BOOLEAN is
		local
			i:INTEGER; trouve:BOOLEAN
		do
			-- On vérifie d'abord si le media est un dvd
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
				-- On vérifie d'abord si le media est un livre
				from
		   			i:=1
				until
		   			trouve=True or i=les_livres.count+1
				loop
					if les_livres.item(i).get_id.is_equal(id_media)
					then
						les_livres.item(i).diminuer_exemplaires
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

		--Fonction qui va modifier l'emprunt en ajoutant une date retour réel
		rendre_emprunt is
			local
		  		id_adh: STRING; id_media_emp: STRING; date_retour: STRING; reussi, exist: BOOLEAN; i: INTEGER
		 	do
		  		io.put_string("-----------------------------%N")
		  		io.put_string("L'id de l'adherent%N")
                  		io.read_line
				id_adh:=""
				id_adh.copy(io.last_string)
				exist:=verif_adh(id_adh)
	          		--Si on réussie à trouver l'adhérent on continue
                		if exist=True
                		then
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
							reussi:=augmenter_exemplaire_media(les_emprunts.item(i).get_id_media, 1)
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
			  	else
					io.put_string("Adherent introuvable, veuillez recommencer la manipulation%N")
					io.put_string("----------------------------------------------------------%N")
				end
		 	end

		-- Fonction qui va augmenter le nombre d'exemplaire d'un media. Il renvoie true s'il y arrive sinon False
		augmenter_exemplaire_media(id_media:STRING; nombre: INTEGER):BOOLEAN is
		local
			i, compteur:INTEGER; trouve:BOOLEAN
		do
			-- On vérifie d'abord si le media est un dvd
			trouve:=False
		  	from
		   		i:=1
		  	until
		   		trouve=True or i=les_dvds.count+1
		  	loop
		   		if les_dvds.item(i).get_id.is_equal(id_media)
		   		then
		   			from
		   				compteur:=1
		   			until
		   				compteur=nombre+1
		   			loop
		   				les_dvds.item(i).augmenter_exemplaires
		   				compteur:=compteur+1
		   			end
					trouve:=True
		   		else
					i:=i+1
		   		end
		  	end
		  	if (trouve=True)
		   	then		
				Result:=trouve
		 	else
		 		-- On vérifie d'abord si le media est un livre
				from
		   			i:=1
				until
		   			trouve=True or i=les_livres.count+1
				loop
					if les_livres.item(i).get_id.is_equal(id_media)
					then
						from
		   					compteur:=1
		   				until
		   					compteur=nombre+1
		   				loop
		   					les_livres.item(i).augmenter_exemplaires
		   					compteur:=compteur+1
		   				end
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
		 
		 --On sauvegarde les informations des adhérents et du membre du personnel dans le fichier globale
		 save_adh is
		 local
		 	i:INTEGER
		 do
		 	create adh_write.make
			adh_write.connect_to("inscrit.txt")
			from
				i:=1
			until
				i=les_adherents.count+1
			loop
				adh_write.put_line(les_adherents.item(i).get_text_file)
				i:=i+1
			end
			from
				i:=1
			until
				i=les_personnels.count+1
			loop
				adh_write.put_line(les_personnels.item(i).get_text_file)
				i:=i+1
			end
			adh_write.disconnect
			create med_write.make
		end
		
		--On sauvegarde les informations des livres et des dvds dans le fichier globale
		 save_med is
		 local
		 	i:INTEGER
		 do
		 	create med_write.make
			med_write.connect_to("document.txt")
			from
				i:=1
			until
				i=les_livres.count+1
			loop
				med_write.put_line(les_livres.item(i).get_text_file)
				i:=i+1
			end
			from
				i:=1
			until
				i=les_dvds.count+1
			loop
				med_write.put_line(les_dvds.item(i).get_text_file)
				i:=i+1
			end
			med_write.disconnect
		end

		--On sauvegarde les informations des emprunts dans le fichier globale
		 save_emp is
		 local
		 i:INTEGER
		 do
		 	create emp_write.make
			emp_write.connect_to("emprunt.txt")
			from
				i:=1
			until
				i=les_emprunts.count+1
			loop
				emp_write.put_line(les_emprunts.item(i).get_text_file)
				i:=i+1
			end
			emp_write.disconnect
		end

end
