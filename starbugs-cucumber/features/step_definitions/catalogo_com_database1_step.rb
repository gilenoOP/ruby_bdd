When('acesso a página principal do Starbugs') do
    @home.open
end

Then('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Given('que estou na página principal da Starbugs') do
    @home.open
end

Given('que desejo comprar o seguinte produto:') do |table|
    #puts table.hashes caso precise validar se o .hashes está pegando os elementos da tabela
    #puts table.hashes.class caso precise validar qual o tipo de dado está retornando
    @product_name = table.hashes[0][:product]
    @product_price = table.hashes[0][:price]
    @delivery_price = table.hashes[0][:delivery]
end

When('inicio a compra desse item') do
    @home.buy(@product_name)
end

Then('devo ver a página de checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product_name, @product_price, @delivery_price)
end

Then('o valor total da compra deve ser {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Then('devo ver uma popup informando que o produto está indisponível') do
    @components.have_text('Produto indisponível')
end