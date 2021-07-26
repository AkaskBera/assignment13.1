*** Keywords ***

Wait Text
    [Arguments]  ${text}
    Wait Until Page Contains  ${text}  timeout=20s

Wait Element
    [Arguments]  ${item_elem}
    Wait Until Page Contains Element  ${item_elem}  timeout=20s