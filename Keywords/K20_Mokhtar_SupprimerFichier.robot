*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         DateTime
Library         String
Variables       ../Locators/locatorsLoginDashbordPage.py
Variables       ../Locators/Locators.py
*** Variables ***
${vURL}         http://localhost:8088/share/page
${TIMEOUT}      5s
${Ligne}
# Dashbord Config page elements
img_RoueDentee = "id=HEADER_TITLE_MENU"
btn_ChangerDisposition = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button"
btn_Mode = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_ChangerDisposition_OK = "id=template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button"

*** Keywords ***
SupprimerFichier
    [Documentation]    test la Supprission d'un fichier
    [Arguments]    ${nFichier}    ${btn_DocSuprrimer}    ${cf_Annuler}
    Click Element    //a[@href='/share/page/context/mine/myfiles']
    # Clique sur le lien du fichier spécifié par son nom.
    Wait Until Element Is Visible    //a[text()='mokhtar']
    Mouse Over    //a[text()='mokhtar']
    Sleep    2
    Click Element    //a[text()='mokhtar']/ancestor::td/following-sibling::td/descendant::a[@class='show-more']
    #Click Element    xpath=//div[@id='onActionShowMore']//span[text()='Plus...']
    #Click Element    xpath=//*[@class='more-actions']/*[@class='document-delete']
    Click Element    //a[@style="background-image:url(/share/res/components/documentlibrary/actions/document-delete-16.png)"]
    # Sleep    2s
    # Cliquer sur le button suppriemr
    ##Wait Until Element Is Visible    //button[text()='Supprimer']
    ##Click Button    //button[text()='Supprimer']
    Sleep    2s
    #Cliquer sur le button supprimer pour confirmer la suppression
    Click Button    //button[text()='Annuler']
    Sleep    2
