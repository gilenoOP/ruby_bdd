require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
require_relative './pages/order.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @components = Popup.new
    @order = OrderPage.new
end

#O After abaixo possui a primeira linha para nomear os arquivos de screenshot com o nome do cenário e sanitizar retirando letras com acentos e espaços no nome, a segunda é para gerar um screenshot no final de cada caso de teste em uma pasta e a terceira para gerar um screenshot no final de cada caso de teste no arquivo de relatório report.html
After do |scenario|
    scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '').gsub(' ', '_')
    screenshot = page.save_screenshot("logs/screenshots/#{scenario_name}.png")
    attach(screenshot, "image/png", "Screenshot")

#O trecho abaixo é para utilizar se quiser apresentar screenshot apenas se houver falhas de cenários.Seria necessário comentar ou excluir o trecho acima.
    # scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '').gsub(' ', '_')
    # if (scenario.failed?)
    #     screenshot = page.save_screenshot("logs/screenshots/#{scenario_name}.png")
    #     attach(screenshot, "image/png", "Screenshot")
    # end
end