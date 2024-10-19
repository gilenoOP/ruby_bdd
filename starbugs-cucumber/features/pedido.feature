Feature: Pedidos
    Como um usuário do site Starbugs, eu quero selecionar e comprar cafés
    Para que eu possa receber os produtos no meu endereço e efetuar o pagamento na entrega

Scenario: Realizar pedido
    Given que estou na página principal da Starbugs
        And que iniciei a compra do item "Expresso Tradicional"
    When faço a busca do cep "04534011"
        And informo os demais dados do endereço:
            | number  | 1000    |
            | details | Apto 22 |
        And escolho a forma de pagamento "Cartão de Débito"
        And finalizo a compra
    Then sou redirecionado para a página de confirmação de pedidos
        And deve ser informado o prazo de entrega '20 min - 30 min'