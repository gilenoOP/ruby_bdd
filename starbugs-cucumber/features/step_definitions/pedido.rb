Given('que iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end

When('faço a busca do cep {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)
end

When('informo os demais dados do endereço:') do |table|
    address = table.rows_hash
    @checkout.fill_address(table.rows_hash)
end

When('escolho a forma de pagamento {string}') do |payment_type|
    @checkout.choice_payment(payment_type)
end

When('finalizo a compra') do
    @checkout.submit
end

Then('sou redirecionado para a página de confirmação de pedidos') do
    @order.assert_order('Uhull! Pedido confirmado', 'Agora é só aguardar que logo o café chegará até você')
end

Then('deve ser informado o prazo de entrega {string}') do |delivery_time|
    @order.assert_delivery_forecast(delivery_time)
end