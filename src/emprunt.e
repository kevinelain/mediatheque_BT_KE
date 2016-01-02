class EMPRUNT
	-- représente la classe des emprunts

creation {ANY}
	make, set_date_retour_r

feature {ANY}
	id_media: STRING
		-- id du média
	id_adh: STRING
		-- id de l'adherent
	date_emp: STRING
		-- date du debut de l'emprunt
	date_retour_p: STRING
		-- date prévu pour le retour
	date_retour_r: STRING
		-- date reel du retour

feature{ANY}
	--constructeur de la classe
	make(new_id_media: STRING; new_id_adh: STRING; new_date_emp: STRING; new_date_retour_p: STRING; new_date_retour_r: STRING)is
		do
			id_media:=new_id_media
			id_adh:=new_id_adh
			date_emp:=new_date_emp
			date_retour_p:=new_date_retour_p
			date_retour_r:=new_date_retour_r
		end
		
	--setter de la classe
	set_id_media(new_id_media: STRING)is
		do
                     id_media:=new_id_media
		end  

	set_id_adh(new_id_adh: STRING)is
		do
                     id_adh:=new_id_adh
		end

	set_date_emprunt(new_date_emp: STRING)is
		do
                     date_emp:=new_date_emp
		end

	set_date_prevu(new_date_retour_p: STRING)is
		do
                     date_retour_p:=new_date_retour_p
		end
		
	set_date_reel(new_date_retour_r: STRING)is
		do
                     date_retour_r:=new_date_retour_r
		end

	--getter de la classe
	get_id_adh: STRING is
		do
                         Result:=id_adh
		end
	
	get_id_media: STRING is
		do
                         Result:=id_media
		end

	set_date_retour_r (new_date_retour_r: STRING) is
		do
			date_retour_r := new_date_retour_r
		end
	get_date_retour_r: STRING is
		do
			Result:=date_retour_r
		end
	
	--On affiche les informations de l'emprunt
	affichage_test is
		do
			io.put_string(" id du media: "+id_media)
			io.put_string("%N date de l'emprunt: "+date_emp)
			io.put_string("%N date de retour prévu: "+date_retour_p)
			io.put_string("%N date de retour véridique (si 0 alors inerendu): "+date_retour_r+"%N")
		end
	
	--On renvoie en string les informations à écrire sur le fichier
	get_text_file : STRING is
		do
			Result:="IdMedia<"+id_media+"> ; IdAdh<"+id_adh+"> ; dateEmprunt<"+date_emp+"> ; dateRetourPrevu<"+date_retour_p+"> ; dateRetourReel<"+date_retour_r+">"
		end
		
	
end
