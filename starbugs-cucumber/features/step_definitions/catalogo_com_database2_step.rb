When('acesso a home do Starbugs') do
    @home.open
end

Then('eu devo ver uma lista de produtos disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Given('que estou na home do Starbugs') do
    @home.open
end

Given('que desejo comprar o produto:') do |table|
    #puts table.rows_hash caso precise validar se o .hashes está pegando os elementos da tabela
    #puts table.rows_hash.class caso precise validar qual o tipo de dado está retornando
    @product_name = table.rows_hash[:product]
    @product_price = table.rows_hash[:price]
    @delivery_price = table.rows_hash[:delivery]
end

When('inicio a compra do produto no site') do
    @home.buy(@product_name)
end

Then('devo ver a página de checkout com os detalhes do produto solicitado') do
    @checkout.assert_product_details(@product_name,@product_price,@delivery_price)
end

Then('o valor total da compra desse produto deve ser {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Then('devo ver uma popup informando que esse produto está indisponível') do
    @components.have_text('Produto indisponível')
end