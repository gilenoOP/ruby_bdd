Feature: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal para que eu possa escolher e saber mais sobre os produtos disponíveis

    Scenario: Acessar o catálogo de café na página principal
        When acesso a homepage do Starbugs
        Then eu devo ver a lista de produtos disponíveis
    
    Scenario: Iniciar a compra de um café
        Given que estou na homepage do Starbugs
            And que pretendo comprar um café:
            | name     | Expresso Gelado |
            | price    | R$ 9,99         |
            | delivery | R$ 10,00        |
        When inicio a compra do café no site
        Then devo ver a página de checkout com os detalhes do café solicitado
            And o valor total da compra do café escolhido deve ser "R$ 19,99"

    Scenario: Café indisponível
        Given que estou na homepage do Starbugs
            And que pretendo comprar um café:
            | name     | Expresso Cremoso |
        When inicio a compra do café no site
        Then devo ver uma popup informando que esse café está indisponível