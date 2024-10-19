Feature: Uso de Cupons no checkout
    Como um usuário da Starbugs, Eu quero aplicar cupons de desconto na página de checkout
    Para que eu possa obter deduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

Background:
    Given que iniciei a compra do item:
        | Name     | Café com Leite |
        | Price    | R$ 19,99       |
        | Delivery | R$ 10,00       |
        | Total    | R$ 29,99       |

Scenario: Aplicar desconto de 20%
    When aplico o seguinte cupom: "MEUCAFE"
    Then o valor final da compra deve ser atualizado para "R$ 25,99"

    # Given que estou na página de Checkout
    #     And o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #     And que a taxa de entrega é de R$ 10,00
    #     And o valor total é de R$ 29,99
    #     And tenho um cupom de 20% de desconto "MEUCAFE"
    # When aplico o cupom de desconto
    # Then o desconto de 20% será aplicado apenas no valor do Café com Leite
    #     And o valor final da compra deve ser atualizado para R$ 25,99

Scenario: Cupom Expirado
    When aplico o seguinte cupom: "PROMO20"
    Then devo ver a notificação "Cupom expirado!"
        And o valor final da compra deve permanecer o mesmo

    # Given que estou na página de Checkout
    #     And o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #     And que a taxa de entrega é de R$ 10,00
    #     And o valor total é de R$ 29,99
    #     And tenho um cupom que está expirado "PROMO20"
    # When eu aplico esse cupom de desconto
    # Then devo ver a seguinte notificação "Cupom expirado!"
    #     And o valor final deve permanecer o mesmo

Scenario: Cupom Inválido
    When aplico o seguinte cupom: "PROMO10000"
    Then devo ver a notificação "Cupom inválido!"
        And o valor final da compra deve permanecer o mesmo

    # Given que estou na página de Checkout
    #     And o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #     And que a taxa de entrega é de R$ 10,00
    #     And o valor total é de R$ 29,99
    #     And tenho um cupom com o código inválido "PROMO10000"
    # When eu aplico esse cupom de desconto
    # Then devo ver a seguinte notificação "Cupom inválido!"
    #     And o valor final deve permanecer o mesmo