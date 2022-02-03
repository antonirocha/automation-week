*Settings*
Documentation       Suite de Testes do Cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
# Library     ${EXECDIR}/resources/factories/Thanos.py
# Library     ${EXECDIR}/resources/factories/Deadpool.py
Library     ${EXECDIR}/resources/factories/Guardians.py

Suite Setup     Super Setup     antonirocha@outlook.com.br
#Test Setup      Set Client Key     antonirocha@outlook.com.br

*Test Cases*
Cadastrar Pesonagem

    ${personagem}   Factory Star Lord
    ${response}     POST New Character  ${personagem}

    Status Should Be        200     ${response}

Personagem Duplicado
    [Tags]      dup

    ${personagem}       Factory Groot
    POST New Character  ${personagem}

    ${response}     POST New Character  ${personagem}

    Status Should Be    409     ${response}
    Should Be Equal    ${response.json()}[error]       Character already exists :(
        