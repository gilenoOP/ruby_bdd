When('acesso a página principal do site Starbugs') do
    @home.open
end

Then('eu devo ver uma lista dos cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Given('que estou na página principal do site Starbugs') do
    @home.open
end

Given('que desejo comprar um café {string}') do |product_name|
    @product_name = product_name
end

Given('que o produto custa {string}') do |product_price|
    @product_price = product_price
end

Given('que o custo da entrega é de {string}') do |delivery_price|
    @delivery_price = delivery_price
end

When('inicio a compra do item') do
    @home.buy(@product_name)
end

Then('devo ver a página de checkout com os detalhes do produto escolhido') do
    @checkout.assert_product_details(@product_name, @product_price, @delivery_price)
end

Then('o valor total da compra do produto deve ser {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Then('deve ser exibida uma popup informando que o produto está indisponível') do
    @components.have_text('Produto indisponível')
end