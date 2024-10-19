Given('que iniciei a compra do item:') do |table|
    # Coloquei o @ no product para ele funcionar como uma "variável global" permitindo a utilização dela em outros casos de testes
    @product = table.rows_hash

    @home.open
    @home.buy(@product[:Name])
end
  
When('aplico o seguinte cupom: {string}') do |coupon_code|
    @checkout.set_discount(coupon_code)
end
  
Then('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.assert_total_price(final_price)
end

Then('devo ver a notificação {string}') do |notice|
    @checkout.assert_notice(notice)
  end
  
Then('o valor final da compra deve permanecer o mesmo') do
    @checkout.assert_total_price(@product[:Total])
  end