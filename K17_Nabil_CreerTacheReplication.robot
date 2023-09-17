#### Locators ####
###################################################################################################################################
# To access 'tache replication' section
link_TacheReplication = "//a[@title='Gestion des tâches de réplication']"
# To open the information form to creat the replication
link_CreerUneTache = "//a[text()='Créer une tâche']"
# Mandatory :To enter name into the 'name' text box of the form
txt_Name = "//input[@name='name']"
# Optional : To enter text description 
txt_Descipt = "//textarea[@title='Description']"
#Optional : Select 'element Source'
button_SelectElementSource = "//div[@id='alf-id0_payload-cntrl-itemGroupActions']//descendant::button[text()='Sélectionner']"
# Select the desired element ${Source} to ADD to the right column
button_plusSignAddSourcePart1 ="//a[text()='"
button_plusSignAddSourcePart2 ="']//ancestor::td//following-sibling::td//span"
# Locator used to wait until ${Source} does appear in the right hand column
wait_ForApparencePart1 = "//h3[text()='"
wait_ForApparencePart2 = "']"
# Button 'ok' to be clicked when all the form is filled
button_Ok = "//span[@id='alf-id0_payload-cntrl-ok']"          
# Optional : Transfer to
button_SelectTransferTo = "//div[@id='alf-id1_targetName-cntrl']//descendant::button"
# Optional : Planning / Thick 'tache planifiee' box
box_TachePlanifiee = "//input[@title='Tâche planifiée']"
# Optional : Autre option / Thick 'activé' box
box_Activé = "//input[@title='Activé']"
# To create the 'tache'
button_CreerUneTache = "//button[text()='Créer une tâche']"
#################################################################################################################################




CreerTacheReplication 

	#############################################################################################################
    # {TacheName}         contient: le nom de la tache a creer													#
    # {TacheDescription}  contient: la Description associée														#	
    # {Source}            contient: le nom du dossier source (element source) a utiliser (a ajouter)			#	
    ############################################################################################################
	
    [Arguments]    ${TacheName}    ${TacheDescription}    ${Source}    
         
    # Ouvrire la page 'Outils admin'
    Click Element    ${link_headerOutilsAdmin}
    # Faire apparaitre la section representant 'tache de replication'
    Click Element    ${link_TacheReplication}
    # Ouvrire la fiche (form) pour la creation de la tache
    Wait Until Element Is Visible    ${link_CreerUneTache}
    Click Element    ${link_CreerUneTache}
    # Entrer le nom de la tache (Obligatoire)
    Input Text    ${txt_Name}      ${TacheName}
    # Entrer la description (Optionnel)
    Input Text    ${txt_Descipt}    ${TacheDescription}
    # Selectionner un element source
    Click Element    ${button_SelectElementSource}
    # Selectionner la source desiree a partir de la laiste existante (colonne de droite et l'ajouter (avec bouton +)
    Wait Until Element Is Visible   ${button_plusSignAddSourcePart1}${Source}${button_plusSignAddSourcePart2}
    Click Element    ${button_plusSignAddSourcePart1}${Source}${button_plusSignAddSourcePart2}
    # Attendre que l'element dans la colonne droite du tableau soit visible (avant de cliquer sur 'ok')
    Wait Until Element Is Visible    ${wait_ForApparencePart1}${Source}${wait_ForApparencePart2}
    # Cliquer boutton 'OK'
    Click Element    ${button_Ok}
    # Creer la tache
    Click Element    ${button_CreerUneTache}
	
	
	

	######################################################################################
    ########       Note: 'Lougout' sera en ECHEC ---  Si on cree un aspect avec      #####
    ########       un nom existant car ce n'est PAS PERMIS et un box de dialogue     #####
    ########        bloquant APPARAITRA.                                             #####
	######################################################################################    