Feature: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal
    Para que eu possa escolher e saber mais sobre os produtos disponíveis

    Scenario: Acessar o catálogo de café na página principal
        When acesso a página principal do site Starbugs
        Then eu devo ver uma lista dos cafés disponíveis

    Scenario: Iniciar a compra de um café
        Given que estou na página principal do site Starbugs
            And que desejo comprar um café "Expresso Gelado"
            And que o produto custa "R$ 9,99"
            And que o custo da entrega é de "R$ 10,00"
        When inicio a compra do item
        Then devo ver a página de checkout com os detalhes do produto escolhido
            And o valor total da compra do produto deve ser "R$ 19,99"

    Scenario: Iniciar a compra de um café indisponível
        Given que estou na página principal do site Starbugs
            And que desejo comprar um café "Expresso Cremoso"
        When inicio a compra do item
        Then deve ser exibida uma popup informando que o produto está indisponível