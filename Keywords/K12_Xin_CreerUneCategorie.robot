*********************************************************************
* Si vous souhaitez uniquement créer une nouvelle catégorie sans    *
* validation, vous pouvez utiliser le KEYWORD 'Creer une catagorie‘ * 
* seulement. 													    *
*********************************************************************


# Outils admin page elements
onglet_outilAdmin = "id=HEADER_ADMIN_CONSOLE_text"
getionnaire_de_catagories = "xpath=//*[@title='Gestionnaire de catégories']"
catagorie_racine = "id=ygtvlabelel1"
icon_ajouter_catagories = "xpath=//*[@id='ygtvlabelel1']/span"
input_Nom_de_catagories ="xpath=//div[@class='bd']//input[@type='text']"
btn_CreerCatagorie_OK ="xpath=//*[@type='button' and text()='OK']"

#valide creation
valide_cate_part1 = "xpath=//*[@id='ygtvc0']//*[text()='"
valide_cate_part2 = "']"


Creer une catagorie
    # vNomDeCatagorie est le nom de catagorie a creer
    [Arguments]    ${vNomDeCatagorie}
    sleep    2s
    # ouvrir onglet 'Outile admin'
    Click Element    ${onglet_outilAdmin}
    # click 'Gestionnaire de categories' dans la liste 'Outils'
    Click Element    ${getionnaire_de_catagories}
    # click 'catagorie racine' pour afficher button de ajouter catagotie (button hidden by defaut)
    Wait Until Element Is Visible    ${catagorie_racine}
    Click Element    ${catagorie_racine}
    # important sleep
    sleep    3s
    # Scroller element dans la zone visible avant de cliquer sur l'element
    Scroll Element Into View    ${icon_ajouter_catagories}
    # click ajouter catagorie icon
    Wait Until Element Is Visible    ${icon_ajouter_catagories}
    Click Element    ${icon_ajouter_catagories}
    # saisir le nom de catagorie a creer
    Wait Until Element Is Visible    ${input_Nom_de_catagories}
    Input Text    ${input_Nom_de_catagories}    ${vNomDeCatagorie}
    # click sur le button OK
    Click Button    ${btn_CreerCatagorie_OK}

Valide creation de catagorie
    [Arguments]    ${vNomDeCatagorie}
    Sleep    3s
    ${element_text} =    Get Text    ${valide_cate_part1}${vNomDeCatagorie}${valide_cate_part2}
    Should Be Equal    ${element_text}    ${vNomDeCatagorie}