#### Locators ####
#####################################################################################################################
## To access Admin page (From : Acceuil page) 
link_headerOutilsAdmin = "xpath=//div[@id='HEADER_ADMIN_CONSOLE']/span/a"
## To access 'Gestionaire de Model' page (From : Outil admin page)
link_GestionnaireModele = "//a[@title='Gestionnaire de modèles']"
## 'Gestionaire de Model' Page Elements
# (Use parts 1 and 2 for concatenation with {Model} inside the Keyword in order to access the desired model)
link_MonModelePart1 = "//span[text()='"
link_MonModelePart2 = "']"
element_CreerUnAspect = "//span[text()='Créer un aspect']"
txt_NomAspect = "//input[@name='name']"
menu_DeroulantAspectParent = "//input[@value='▼ ']"
Select_AspactParentPart1 = "//tr[@aria-label='"
Select_AspactParentPart2 = " ']"
txt_EtiquetteAffichage = "//input[@name='title']"
txt_Description = "//textarea[@name='description' and @autocomplete='off']"
btn_CreerAspect = "//span[text()='Créer']"
###################################################################################################################




CreerAspect

	#####################################################################################################
	# {Model}                contient: le nom du model que l'on va utiliser pour notre test 			#
    # {AspectNom}            contient: le nom de l'aspect												#	
    # {AspectParent}         contient: Selectionner un aspect parent du menu deroulant					#
    ###  Il y'a plusieurs choix dont la valeur par defaut : (Aucun)										#			
    ### Si on veut choisir(selectionner) un choix particulier parmis les choix existants dans 			#
    ### la liste deroulante, il va faloir aller et 'inspecter' la liste en question et en retirer 		#
    ### le text qui se trouve dans la partie : 															#	
    ### aria-label="XXXXXXXXXXXX"   ou bien la partie 'texte' directement (entre les balises)			#
    # {EtiquetteAffichage}   contient: y mettre du texte												#					
    # {Description}          contient: y mettre du texte												#			
    #####################################################################################################
	
    [Arguments]    ${Model}    ${AspectNom}    ${AspectParent}    ${EtiquetteAffichage}    ${Description}

    # Ouvrire la page 'Outils admin'
    Click Element    ${link_headerOutilsAdmin}
    # Ouvrire la page 'Gestionaire de modeles'
    Click Element    ${link_GestionnaireModele}
    # Temps d'arret le temps que la liste des modeles s'affiche
    Wait Until Element Is Visible   ${link_MonModelePart1}${Model}${link_MonModelePart2}
    # Dans le cas ou il y'aurait un soucis par rapport a la commande du 'Wait until..' ci dessus? La mettre en commentaire et déclancher le 'Sleep 2'	
    #Sleep    2  
    # Acceder au model desiré
    Click Element    ${link_MonModelePart1}${Model}${link_MonModelePart2}
    Wait Until Element Is Visible    ${element_CreerUnAspect}
    Click Element    ${element_CreerUnAspect}
    # Remplir le formulaire pour les details du nouvel 'Aspect':
    # Entrer le nom (Obligatoire)
    Input Text    ${txt_NomAspect}    ${AspectNom}
    # Sélectionnez un aspect parent (facultatif) / Default = 'AUCUN' 
    Click Element    ${menu_DeroulantAspectParent}  
    Wait Until Element Is Visible    ${Select_AspactParentPart1}${AspectParent}${Select_AspactParentPart2}
    Click Element    ${Select_AspactParentPart1}${AspectParent}${Select_AspactParentPart2}
    Input Text    ${txt_EtiquetteAffichage}    ${EtiquetteAffichage}
    ## Entrez description (facultatif).
    Input Text    ${txt_Description}    ${Description}
    # Cliquer sur le bouton creer
    Click Element    ${btn_CreerAspect}  


	######################################################################################
    ########       Note: 'Lougout' sera en ECHEC ---  Si on cree un aspect avec      #####
    ########       un nom existant car ce n'est PAS PERMIS et un box de dialogue     #####
    ########        bloquant APPARAITRA.                                             #####
	######################################################################################


