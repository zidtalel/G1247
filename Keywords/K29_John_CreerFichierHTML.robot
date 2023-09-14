link_HeaderMesFichier="id=HEADER_MY_FILES"
btn_createDoc = "xpath=//div[@class='create-content']/span/span/button"
link_DocHTML = "xpath=//a[@href='/share/page/context/mine/create-content?destination={nodeRef}&itemId=cm:content&mimeType=text/html']"
txt_nomFichier = "xpath=//input[@name='prop_cm_name']"
btn_createContent = "xpath=//div[@class='form-buttons']/span[@class='yui-button yui-submit-button alf-primary-button']"
btn_createContent2 = "xpath=//div[@class='form-buttons']//button[@id='template_x002e_create-content_x002e_create-content_x0023_default-form-submit-button']"

Creer un fichier html
    [Arguments]    ${vNomFichierHtml}
    Click Element                    ${link_HeaderMesFichier}                   # Cliquer lien 'Mes Fichiers'
    Wait Until Element Is Visible    ${btn_createDoc}                           # Attendre bouton/menu déroulant 'Créer' visible
    Click Button                     ${btn_createDoc}                           # Cliquer bouton/menu déroulant 'Créer'
    Wait Until Element Is Visible    ${link_DocHTML}                            # Attendre option 'HTML' visible
    Click Element                    ${link_DocHTML}                            # Cliquer option 'HTML'
    Wait Until Element Is Visible    ${txt_nomFichier}                          # Attendre formulaire soit visible
    Input Text                       ${txt_nomFichier}    ${vNomFichierHtml}    # Entrer nom nouveau fichier html
    Wait Until Element Is Visible    ${btn_createContent}                       # Attendre bouton 'Créer' visible/éléments ne chargent pas à même vitesse
    Click Button                     ${btn_createContent2}                      # Cliquer bouton 'Créer'
    Wait Until Page Contains         ${vNomFichierHtml}                         # Valider nom du fichier créé