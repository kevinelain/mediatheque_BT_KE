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

	affichage_test is
		do
			io.put_string(id_media)
			io.put_string("%N"+date_emp)
			io.put_string("%N"+date_retour_p)
			io.put_string("%N"+date_retour_r+"%N")
		end
end
