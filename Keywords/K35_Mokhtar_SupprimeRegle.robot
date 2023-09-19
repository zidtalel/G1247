*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           DateTime
Library           String
Variables         ../Locators/locatorsLoginDashbordPage.py
Variables         ../Locators/Locators.py
*** Variables ***
${vURL}    http://localhost:8088/share/page
${TIMEOUT}    5s
${Ligne}
# Dashbord Config page elements
img_RoueDentee = "id=HEADER_TITLE_MENU"
btn_ChangerDisposition = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button"
btn_Mode = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_ChangerDisposition_OK = "id=template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button"
*** Keywords ***
SupprimeRegle
    [Arguments]    ${nFichier}    ${nRegle}    ${btn_RegSuprrimer}    ${cf_Annuler}
    Click Element    //a[@href='/share/page/context/shared/sharedfiles']
    Wait Until Element Is Visible    //a[text()='test101']
    Mouse Over    //a[text()='test101']
    Click Element    xpath=//div[@id='onActionShowMore']//span[text()='Plus...']
    Click Element    //a[@style="background-image:url(/share/res/components/documentlibrary/actions/folder-manage-rules-16.png)"]
    # Sleep  2s
    # Cliquer sur le button suppriemr
    Wait Until Element Is Visible    //button[text()='Supprimer']
    Click Button    //button[text()='Supprimer']
    Sleep    2s
    #Cliquer sur le button supprimer pour confirmer la suppression
    Click Button    //button[text()='Annuler']