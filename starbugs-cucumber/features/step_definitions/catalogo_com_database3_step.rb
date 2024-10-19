When('acesso a homepage do Starbugs') do
    @home.open
end

Then('eu devo ver a lista de produtos disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Given('que estou na homepage do Starbugs') do
    @home.open
end

Given('que pretendo comprar um café:') do |table|
    @product = table.rows_hash
end

When('inicio a compra do café no site') do
    @home.buy(@product[:name])
end

Then('devo ver a página de checkout com os detalhes do café solicitado') do
    @checkout.assert_product_details(@product[:name], @product[:price], @product[:delivery])
end

Then('o valor total da compra do café escolhido deve ser {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Then('devo ver uma popup informando que esse café está indisponível') do
    @components.have_text('Produto indisponível')
end