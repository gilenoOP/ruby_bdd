Feature: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal para que eu possa escolher e saber mais sobre os produtos disponíveis

    Scenario: Acessar o catálogo de café na página principal
        When acesso a página principal do Starbugs
        Then eu devo ver uma lista de cafés disponíveis
    
    Scenario: Iniciar a compra de um café
        Given que estou na página principal da Starbugs
            And que desejo comprar o seguinte produto:
            | product         | price   | delivery |
            | Expresso Gelado | R$ 9,99 | R$ 10,00 |
        When inicio a compra desse item
        Then devo ver a página de checkout com os detalhes do produto
            And o valor total da compra deve ser "R$ 19,99"

    Scenario: Café indisponível
        Given que estou na página principal da Starbugs
            And que desejo comprar o seguinte produto:
            | product          |
            | Expresso Cremoso |
        When inicio a compra desse item
        Then devo ver uma popup informando que o produto está indisponível