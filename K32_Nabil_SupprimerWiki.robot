#### Locators ####
###################################################################################################################################
# To access Sites listing
list_sites = "//span[@id='HEADER_SITES_MENU_text']"
# To actually select and access to the page 'Mes Sites' for the list
link_MesSites = "//a[@title='Mes sites']"
# Select the desired site name(using  argument ${MonSite} ) and access it
link_MonSitePart1 = "//a[text()='"
link_MonSitePart2 = "']"
# To access Wiki page
link_Wiki = "//a[@title='Wiki']"
# To open the Wiki pages list 
list_Wikis = "//span[@class='forwardLink']/child::a"
# To open the desired (to delete) wiki page
link_WikitoDelete1 = "//div[@class='pageTitle']//child::a[text()='"
link_WikitoDelete2 = "']"
# To click on the delete (supprimer) button
btn_SupprimerWiki = "//div[@class='delete-page']/descendant::button"
# To confirm suppression 
btn_SupprimerConfirmation = "//span[@class='button-group']//descendant::button[text()='Supprimer']"
#################################################################################################################################



SupprimerPageWiki  

   	######## -----Ne Pas OUBLIER de VERIFIER que le Wiki a supprimer EXISTE!! ------    #####
	#########################################################################################
    # {Monsite}     contient: le site dans le quel nous desirons supprimer le wiki			#
    # {MaPageWiki}  contient: Le nom de la page wiki a supprimer							#
	########################################################################################
	
    [Arguments]    ${Monsite}    ${PageWiki}

    # Ouvrire le menu deroulant de l'onglet 'Sites' 
    Click Element    ${list_sites}
    # Selectioner 'Mes Sites' a partir du menu et cliquer dessus
    Wait Until Element Is Visible    ${link_MesSites} 
    Click Element    ${link_MesSites} 
    # Dans la page 'Mes Sites' Selectionner mon Site (Ou se trouve le wiki)
    Click Element    ${link_MonSitePart1}${Monsite}${link_MonSitePart2}
    # Ouvrire la page des 'Wiki'
    Click Element    ${link_Wiki}
    # Afficher la list des pages Wiki (de ce site)
    Wait Until Element Is Visible    ${list_Wikis}
    Click Element    ${list_Wikis}
    # Ouvrire la page Wiki a supprimer
    Wait Until Element Is Visible    ${link_wikitoDelete1}${PageWiki}${link_wikitoDelete2}   
    Click Element    ${link_WikitoDelete1}${PageWiki}${link_WikitoDelete2}
    # Cliquer sur le boutton 'Supprimer'
    Wait Until Element Is Visible    ${btn_SupprimerWiki}
    Click Button    ${btn_SupprimerWiki}
    # Cliquer sur le bouton de Confirmation dans le box pour valider la supression
    Wait Until Element Is Visible   ${btn_SupprimerConfirmation} 
    Click Button    ${btn_SupprimerConfirmation} 