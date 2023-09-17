
##########LOCATORS Pour SupprimerUnLienDuSite ###############

####Module Pour SupprimerUnLienDuSite K24####

Onglet_Sites="//span[@id='HEADER_SITES_MENU_text']"
Mes_Sites="//a[text()='Mes sites']"
Onglet_Liens="//a[text()='Liens']"
link_MonSitePart1 = "//a[text()='"
link_MonSitePart2 = "']"

link_MonLienPart1="//a[text()='"
link_MonLienPart2="']"
btn_SupprimerLien="//a[text()='Supprimer']"
btn_supprimerConfirm="//span[@class='first-child']/*[text()='Supprimer']"




##########KeyWord Pour SupprimerUnLienDuSite ###############


SupprimerUnLienDuSite    ###(Le site déja existant)    ####K24

    [Arguments]    ${MonSite}    ${MonLien}
    # ${MonSite}: definit le site sur lequel on veut supprimer le lien ; il doit etre dans notre liste de sites
    # ${MonLien}: il s'agit du lien qu'on veut supprimer .
    ###Avant d'éxécuter s'assurer que le lien qu'on voudrait supprimer existe biensur 

    # Ouvrir la page "Sites"
    Click Element    ${Onglet_Sites}
	
    # Aller sur 'Mes Sites'
    Wait Until Element Is Visible    ${Mes_Sites}
    Click Element    ${Mes_Sites}

    # cliquer sur le site "variable MonSite "
    Wait Until Element Is Visible    ${link_MonSitePart1}${MonSite}${link_MonSitePart2}
    Click Element    ${link_MonSitePart1}${MonSite}${link_MonSitePart2}

    # Cliquer sur Liens
    Wait Until Element Is Visible    ${Onglet_Liens}
    Click Element    ${Onglet_Liens}

    # Cliquer sur le nom du lien 'a supprimer
    Wait Until Element Is Visible    ${link_MonLienPart1}${MonLien}${link_MonLienPart2}
    Click Element    ${link_MonLienPart1}${MonLien}${link_MonLienPart2}

    # Cliquer sur supprimer
    Wait Until Element Is Visible    ${btn_SupprimerLien}
    Click Element    ${btn_SupprimerLien}

    # Cliquer pour confirmer la suppression
    Wait Until Element Is Visible    ${btn_supprimerConfirm}
    Click Button    ${btn_supprimerConfirm}
	





  