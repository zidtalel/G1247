# Localisateurs pour accéder aux Modèles et Aspects
link_ModelePart1="//span[text()='"
link_ModelePart2="']"
link_AspectPart1="//span[contains(text(),'"
link_AspectPart2="')]"

# Localisateurs pour la création d'une propriété dans un aspect
btn_CreerPropriete="//*[contains(@id,'cmm_buttons_CMMHashPayloadButton___')]"

# Localisateurs de base pour la création d'une propriété
txt_NomPropriete="//input[@name='name']"
txt_Etiquette="//input[@name='title']"
txt_DescriptionPropriete="//div[@class='control']/textarea[@name='description']"
liste_TypeDonneesPropriete="//input[@name='datatype']/ancestor::td" #//div[@class='alfresco-forms-controls-BaseFormControl wipe create-property-datatype alfresco-forms-controls-Select']/descendant::tr
liste_RequisePropriete="//input[@name='mandatory']/.."
chk_MultiplePropriete="//input[@name='multiple']"
txt_ValeurDefault="//div[@class='alfresco-forms-controls-BaseFormControl wipe create-property-default text alfresco-forms-controls-TextBox']/descendant::input[@name='defaultValue']"
nb_ValeurDefault="//div[@class='alfresco-forms-controls-BaseFormControl wipe create-property-default number alfresco-forms-controls-TextBox']/descendant::input[@name='defaultValue']"
liste_ValeurDefault="//input[@name='defaultValue']/parent::td"
date_ValeurDefault="//input[@name='defaultValue']/preceding-sibling::input"
liste_ContraintePropriete="//input[@name='constraint']/.."
liste_indexPropriete="//input[contains(@name,'indexing_')]/.."
liste_indexPropriete1="//input[contains(@name,'indexing_txt')]/.."
liste_indexPropriete2="//input[contains(@name,'indexing_nontxt')]/.."
liste_indexPropriete3="//input[contains(@name,'indexing_boolean')]/.."
btn_CreerPropriete2="//span[@id='CMM_CREATE_PROPERTY_DIALOG_CREATE_label']"

# Localisateurs des choix possibles dans les listes 
typeDonneesProprieteP1="//tr[@data-value='d:"
typeDonneesProprieteP2="']"
localisateur_ProprieteP1="//tr[@data-value='"
localisateur_ProprieteP2="']"

verification_index="//tr[contains(@data-value,'-none')]"

# Localisateurs des diffèrente possibilité des contraintes
txt_ExpressionReguliere="//input[@name='constraintExpression']"
nb_LongueurMin="//input[@name='constraintMinLength']/preceding-sibling::input"
nb_LongueurMax="//input[@name='constraintMaxLength']/preceding-sibling::input"
nb_ValeurMin="//input[@name='constraintMinValue']/preceding-sibling::input"
nb_ValeurMax="//input[@name='constraintMaxValue']/preceding-sibling::input"
txt_ListeValeurs="//textarea[@name='constraintAllowedValues']"
chk_TrieAlphaPropriete="//input[@name='constraintSorted']"
txt_NomClassePropriete="//input[@name='constraintClass']"


*** Variables ***
# Noms du modele et de l'aspect
${vNomModele}               Modele_Ines
${vNomAspect}               AspectTest

# Variables principales qui ne changent pas
${nomPropriete}            Test1               # Section obligatoire , doit contenir du texte
${etiquette}                Test2              # Peut contenir du texte
${description}              TestDescription    # Peut contenir du texte
${typeDonnees}              boolean            # doit contenir: text ; mltext ; int ; long ; float ; double ; date ; datetime ; boolean
${requisPropriete}          mandatory          # doit contenir: optional ; mandatory
${multiple}                 true               # true pour cocher, false pour decocher
${contraintePropriete}      REGEX              # doit contenir: NONE ; REGEX ; LENGTH(avec text ou mltext) ; MINMAX(avec int ; long ; float ; double) ; LIST ; CLASS(ne fonctionne pas)

# Variable qui peuvent changer selon le choix de ${typeDonnees}
${valeurParDefaut}          valeurTest         # Peut contenir du texte
${valeurParDefaut2}         01/09/2023         # jj/mm/aaaa
${valeurParDefaut3}         true               # true ; false
${valeurParDefaut4}         200                # doit contenir des chiffres
${indexPropriete}           txt-list-partial   # txt-none ; txt-free ; txt-list-whole ; txt-list-partial ; txt-pattern-unique ; txt-pattern-many
${indexPropriete2}          boolean-standard   # boolean-none ; boolean-standard
${indexPropriete3}          nontxt-standard    # nontxt-none ; nontxt-standard ; nontxt-enhanced

# variables qui peuvent s'ajouter selon le choix de ${contraintePropriete}
${nb_Min}                   2                  # doit contenir des chiffres
${nb_Max}                   500                # doit contenir des chiffres
${vContrainte}              valeurTest23       # doit contenir du texte: doit etre égale à valeur par defaut si cette dernière contient une donnée
${inputValeur}      ${EMPTY}	               # doit ete vide



*** Keywords ***
CréerProprieteAspect
    [Arguments]    ${vNomModele}    ${vNomAspect}
    ...    ${NomPropriete}
    ...    ${Etiquette}
    ...    ${Description}
    ...    ${TypeDonnees}
    ...    ${multiple}
    ...    ${valeurParDefaut}
    ...    ${requisPropriete}
    ...    ${indexPropriete}
    ...    ${contraintePropriete}
    ...    ${indexPropriete2}
    ...    ${indexPropriete3}    ${valeurParDefaut2}
    ...    ${valeurParDefaut3}
    ...    ${valeurParDefaut4}    ${nb_Min}    ${nb_Max}    ${vContrainte}

    # ${vNomModele} doit contenir le nom du modele
    # ${vNomAspect} doit contenir le nom de l'Aspect
    # Acceder au modele choisi
    Wait Until Element Is Visible    ${link_ModelePart1}${vNomModele}${link_ModelePart2}
    Click Element    ${link_ModelePart1}${vNomModele}${link_ModelePart2}
    # Acceder a l'Aspect choisi
    Sleep    2
    Click Element    ${link_AspectPart1}${vNomAspect}${link_AspectPart2}

    # Click sur le bouton creer propriete
    Wait Until Element Is Visible    ${btn_CreerPropriete}
    Click Element    ${btn_CreerPropriete}

    # Noter les informations de la propriété
    Wait Until Element Is Visible    ${txt_NomPropriete}
  # Noter le Nom
    Input Text    ${txt_NomPropriete}    ${NomPropriete}
  # Noter l'étiquette d'affichage
    Input Text    ${txt_Etiquette}    ${Etiquette}
  # Noter la Description
    Input Text    ${txt_DescriptionPropriete}    ${Description}

  # Type de Donnees
    # Selectionner le type de données. peut contenir: text ; mltext ; int ; long ; float ; double ; date ; datetime ; boolean
    # Le choix du type de données sélectionné modifie les cases 'Valeur par défaut' et 'Indexation'. Voir les keywords 'ChoixValeurParDefaultEtContrainte' et 'ChoixIndexation' qui gérent les diffèrentes possibilités.
    # Utilisation de '${element_nonvisible}    Run Keyword And Return Status    Element Should Not Be Visible ...' afin de gérer le Bug des listes déroulante sur Alfresco
    Click Element    ${liste_TypeDonneesPropriete}
    ${element_nonvisible}    Run Keyword And Return Status
    ...    Element Should Not Be Visible
    ...    ${typeDonneesProprieteP1}${typeDonnees}${typeDonneesProprieteP2}
    IF    ${element_nonvisible}
        Click Element    ${liste_TypeDonneesPropriete}
    END
    Click Element    ${typeDonneesProprieteP1}${typeDonnees}${typeDonneesProprieteP2}

  # Requise
    # Indiquez si la valeur de la propriété est facultative ou obligatoire. peut contenir: optional ; mandatory
    Click Element    ${liste_RequisePropriete}
    # Click Element    ${liste_RequisePropriete}
    ${element_nonvisible}    Run Keyword And Return Status
    ...    Element Should Not Be Visible
    ...    ${localisateur_ProprieteP1}${requisPropriete}${localisateur_ProprieteP2}
    IF    ${element_nonvisible}    Click Element    ${liste_RequisePropriete}
    Click Element    ${localisateur_ProprieteP1}${requisPropriete}${localisateur_ProprieteP2}

  # Multiple
    # Cocher ou décocher la checkbox Multiple. peut contenir: true ; false
    IF    '${multiple}' == 'true'
        Select Checkbox    ${chk_MultiplePropriete}
    ELSE
        Unselect Checkbox    ${chk_MultiplePropriete}
    END

# Valeur Par Default et Contrainte
# Noter ou selectionner la valeur par défaut selon le choix fait dans la liste type de donnée.
# Selectionner la contrainte. le choix peux ajouter de nouvelle case a remplir
# Utilisation de la keyword 'ChoixValeurParDefaultEtContrainte' pour gérer les possibilité selon le choix fait dans la liste type de donnée.
    ChoixValeurParDefaultEtContrainte
    ...    ${typeDonnees}
    ...    ${valeurParDefaut}
    ...    ${valeurParDefaut2}
    ...    ${valeurParDefaut3}
    ...    ${valeurParDefaut4}    ${inputValeur}    ${contraintePropriete}
    ...    ${vContrainte}
    ...    ${nb_Min}
    ...    ${nb_Max}

    # Indexation
    # Utilisation de la keyword 'ChoixIndexation' pour gérer les possibilités selon le choix fait dans la liste type de donnée.
    ChoixIndexation    ${typeDonnees}    ${indexPropriete}    ${indexPropriete2}    ${indexPropriete3}

    # Cliquer sur le bouton créer
    Click Element    ${btn_CreerPropriete2}

ChoixValeurParDefaultEtContrainte
# Gerer les choix possible dans la Valeur par default selon le type de donnée selectionné
# Utilisation de la keyword 'ChoixValeurParDefaultEtContrainte' pour gérer les possibilité selon le choix fait dans la liste type de donnée.
    [Arguments]
    ...    ${typeDonnees}
    ...    ${valeurParDefaut}
    ...    ${valeurParDefaut2}
    ...    ${valeurParDefaut3}
    ...    ${valeurParDefaut4}    ${inputValeur}    ${contraintePropriete}
    ...    ${vContrainte}
    ...    ${nb_Min}
    ...    ${nb_Max}
    IF    '${typeDonnees}' == 'text' or '${typeDonnees}' == 'mltext'
        Input Text    ${txt_ValeurDefault}    ${valeurParDefaut}
        ${inputValeur}    Set Variable    ${valeurParDefaut}
    ELSE
        IF    '${typeDonnees}' == 'date' or '${typeDonnees}' == 'datetime'
            Input Text    ${date_ValeurDefault}    ${valeurParDefaut2}
            ${inputValeur}    Set Variable    ${valeurParDefaut2}
            # La date apparait en "jj/mm/aaaa" il faut la formatter en "aaaa-mm-jj" pour l'utiliser dans le champs contrainte
            ${formatted_date}    Evaluate
            ...    "${inputValeur.split('/')[2]}-${inputValeur.split('/')[1]}-${inputValeur.split('/')[0]}"
            ${inputValeur}    Set Variable    ${formatted_date}
        ELSE
            IF    '${typeDonnees}' == 'boolean'
                Click Element    ${liste_ValeurDefault}
                ${element_nonvisible}    Run Keyword And Return Status
                ...    Element Should Not Be Visible
                ...    ${localisateur_ProprieteP1}${valeurParDefaut3}${localisateur_ProprieteP2}
                IF    ${element_nonvisible}
                    Click Element    ${liste_ValeurDefault}
                END
                Click Element
                ...    ${localisateur_ProprieteP1}${valeurParDefaut3}${localisateur_ProprieteP2}
                ${inputValeur}    Set Variable    ${valeurParDefaut3}
            ELSE
                Input Text    ${nb_ValeurDefault}    ${valeurParDefaut4}
                ${inputValeur}    Set Variable    ${valeurParDefaut4}
            END
        END
    END
    Click Element    ${liste_ContraintePropriete}
    ${element_nonvisible}    Run Keyword And Return Status
    ...    Element Should Not Be Visible
    ...    ${localisateur_ProprieteP1}${contraintePropriete}${localisateur_ProprieteP2}
    IF    ${element_nonvisible}    Click Element    ${liste_ContraintePropriete}
    Click Element    ${localisateur_ProprieteP1}${contraintePropriete}${localisateur_ProprieteP2}

# ChoixContrainte
# Gerer les choix possible dans les case générer selon le type de donnée selectionné dans Contrainte
    IF    '${contraintePropriete}' == 'REGEX'
        ${isEmpty}    Run Keyword And Return Status    Should Be Empty    ${inputValeur}
        IF    '${isEmpty}' != 'True'
            Input Text    ${txt_ExpressionReguliere}    ${inputValeur}
        ELSE
            Input Text    ${txt_ExpressionReguliere}    ${vContrainte}
        END
    ELSE
        IF    '${contraintePropriete}' == 'LENGTH'
            Input Text    ${nb_LongueurMin}    ${nb_Min}
            AND Input Text    ${nb_LongueurMax}    ${nb_Max}
        ELSE
            IF    '${contraintePropriete}' == 'MINMAX'
                Input Text    ${nb_ValeurMin}    ${nb_Min}
                AND Input Text    ${nb_ValeurMax}    ${nb_Max}
            ELSE
                IF    '${contraintePropriete}' == 'LIST'
                    ${isEmpty}    Run Keyword And Return Status    Should Be Empty    ${inputValeur}
                    IF    '${isEmpty}' != 'True'
                        Input Text    ${txt_ListeValeurs}    ${inputValeur}
                    ELSE
                        Input Text    ${txt_ListeValeurs}    ${vContrainte}
                    END
                    Select Checkbox    ${chk_TrieAlphaPropriete}
                ELSE
                    IF    '${contraintePropriete}' == 'CLASS'
                        # Ne fonctionne pas, possible Bug
                        ${isEmpty}    Run Keyword And Return Status    Should Be Empty    ${inputValeur}
                        IF    '${isEmpty}' != 'True'
                            Input Text    ${txt_NomClassePropriete}    ${inputValeur}
                        ELSE
                            Input Text    ${txt_NomClassePropriete}    ${vContrainte}
                        END
                    END
                END
            END
        END
    END

ChoixIndexation
# Gerer les choix possible dans Indexation selon le type de donnée selectionné
# Utilisation de la keyword 'ChoixValeurParDefault' pour gérer les possibilité selon le choix fait dans la liste type de donnée.
    [Arguments]    ${typeDonnees}    ${indexPropriete}    ${indexPropriete2}    ${indexPropriete3}
    IF    '${typeDonnees}' == 'boolean'
        Scroll Element Into View    ${liste_indexPropriete3}
        Click Element    ${liste_indexPropriete3}
        ${element_nonvisible}    Run Keyword And Return Status
        ...    Element Should Not Be Visible
        ...    ${verification_index}
        IF    ${element_nonvisible}
            Scroll Element Into View    ${liste_indexPropriete3}
            AND Click Element    ${liste_indexPropriete3}
        END
        Click Element    ${localisateur_ProprieteP1}${indexPropriete2}${localisateur_ProprieteP2}
    ELSE
        IF    '${typeDonnees}' == 'text' or '${typeDonnees}' == 'mltext'
            Scroll Element Into View    ${liste_indexPropriete1}
            Click Element    ${liste_indexPropriete1}
            ${element_nonvisible}    Run Keyword And Return Status
            ...    Element Should Not Be Visible
            ...    ${verification_index}
            IF    ${element_nonvisible}
                Scroll Element Into View    ${liste_indexPropriete1}
                AND Click Element    ${liste_indexPropriete1}
            END
            Click Element    ${localisateur_ProprieteP1}${indexPropriete}${localisateur_ProprieteP2}
        ELSE
            Scroll Element Into View    ${liste_indexPropriete2}
            Click Element    ${liste_indexPropriete2}
            ${element_nonvisible}    Run Keyword And Return Status
            ...    Element Should Not Be Visible
            ...    ${verification_index}
            IF    ${element_nonvisible}
                Scroll Element Into View    ${liste_indexPropriete2}
                AND Click Element    ${liste_indexPropriete2}
            END
            Click Element    ${localisateur_ProprieteP1}${indexPropriete3}${localisateur_ProprieteP2}
        END
    END



*** Test Cases ***
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    OptionMenuOutilsAdmin    custom-model-manager   # Keywords K45
    Sleep    2
    CréerProprieteAspect    ${vNomModele}    ${vNomAspect}
    ...    ${nomPropriete}
    ...    ${etiquette}
    ...    ${description}
    ...    ${typeDonnees}
    ...    ${multiple}
    ...    ${valeurParDefaut}
    ...    ${requisPropriete}
    ...    ${indexPropriete}
    ...    ${contraintePropriete}
    ...    ${indexPropriete2}
    ...    ${indexPropriete3}    ${valeurParDefaut2}
    ...    ${valeurParDefaut3}
    ...    ${valeurParDefaut4}    ${nb_Min}    ${nb_Max}    ${vContrainte}
    Sleep    3
    Logout