class OrderPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_order(msg1, msg2)
        expect(find('h1').text).to eql msg1
        expect(find('p[color=subtitle]').text).to eql msg2
    end

    def assert_delivery_forecast(delivery_time)
        delivery_forecast = find('p', text: 'Previsão de entrega')
        expect(delivery_forecast.find('strong').text).to eql delivery_time
    end
end