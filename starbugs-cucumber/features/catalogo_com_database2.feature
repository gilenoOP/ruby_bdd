Feature: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal
    Para que eu possa escolher e saber mais sobre os produtos disponíveis

    Scenario: Acessar o catálogo de café na página principal
        When acesso a home do Starbugs
        Then eu devo ver uma lista de produtos disponíveis
    
    Scenario: Iniciar a compra de um café
        Given que estou na home do Starbugs
            And que desejo comprar o produto:
            | product  | Expresso Gelado |
            | price    | R$ 9,99         |
            | delivery | R$ 10,00        |
        When inicio a compra do produto no site
        Then devo ver a página de checkout com os detalhes do produto solicitado
            And o valor total da compra desse produto deve ser "R$ 19,99"

    Scenario: Iniciar a compra de um café indisponível
        Given que estou na home do Starbugs
            And que desejo comprar o produto:
            | product  | Expresso Cremoso |
        When inicio a compra do produto no site
        Then devo ver uma popup informando que esse produto está indisponível