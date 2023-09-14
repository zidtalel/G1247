link_HeaderMesFichier="id=HEADER_MY_FILES"
btn_createDoc = "xpath=//div[@class='create-content']/span/span/button"
link_DocHTML = "xpath=//a[@href='/share/page/context/mine/create-content?destination={nodeRef}&itemId=cm:content&mimeType=text/html']"
txt_nomFichier = "xpath=//input[@name='prop_cm_name']"
btn_createContent = "xpath=//div[@class='form-buttons']/span[@class='yui-button yui-submit-button alf-primary-button']"
btn_createContent2 = "xpath=//div[@class='form-buttons']//button[@id='template_x002e_create-content_x002e_create-content_x0023_default-form-submit-button']"
txt_titreFichier = "xpath=//input[@name='prop_cm_title']"
txt_descriptionFichier = "xpath=//textarea[@name='prop_cm_description']"

Creer un fichier html
    # vNomFichierHtml est le nom du fichier .html que vous voulez créer. Vous expliciterez la valeur lors de l'écriture du script.
    # vContenuFichierHtml est le contenu du fichier .html que vous voulez créer. Vous expliciterez sa valeur lors de l'écriture du script.
    # vTitreFichierHtml est le champ 'Titre' au bas du formulaire. Vous expliciterez la valeur lors de l'écriture du script.
    # vDescriptionFichierHtml est le champ 'Description' au bas du formulaire. Vous expliciterez la valeur lors de l'écriture du script.
    [Arguments]    ${vNomFichierHtml}    ${vContenuFichierHtml}    ${vTitreFichierHtml}    ${vDescriptionFichierHtml}
    ${codeNomFichier}=    Init Date
    Click Element                    ${link_HeaderMesFichier}                                   # Cliquer lien 'Mes Fichiers'
    Wait Until Element Is Visible    ${btn_createDoc}                                           # Attendre bouton/menu déroulant 'Créer' visible
    Click Button                     ${btn_createDoc}                                           # Cliquer bouton/menu déroulant 'Créer'
    Wait Until Element Is Visible    ${link_DocHTML}                                            # Attendre option 'HTML' visible
    Click Element                    ${link_DocHTML}                                            # Cliquer option 'HTML'
    Wait Until Element Is Visible    ${txt_nomFichier}                                          # Attendre formulaire soit visible
    Input Text                       ${txt_nomFichier}    ${vNomFichierHtml}${codeNomFichier}   # Entrer nom nouveau fichier html
    #Wait Until Element Is Visible    ${iframe_ContenuFichier}
    Execute Javascript               tinyMCE.activeEditor.setContent('${vContenuFichierHtml}')  # Inscrire le texte désiré dans le iframe
    Wait Until Element Is Visible    ${txt_titreFichier}
    Input Text                       ${txt_titreFichier}    ${vTitreFichierHtml}
    Wait Until Element Is Visible    ${txt_descriptionFichier}
    Input Text                       ${txt_descriptionFichier}    ${vDescriptionFichierHtml}
    Wait Until Element Is Visible    ${btn_createContent}                                       # Attendre bouton 'Créer' visible
    Click Button                     ${btn_createContent2}                                      # Cliquer bouton 'Créer'
    Wait Until Page Contains         ${vNomFichierHtml}                                         # Valider nom du fichier créé