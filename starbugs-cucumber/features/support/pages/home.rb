class HomePage
    #O método visit funciona no Capybara, mas o cucumber não sabe que existe uma camada personalizada (pages). O comando abaixo deixa claro que você quer usar todos os recursos do Capybara dentro dessa classe
    include Capybara::DSL

    def open
        visit 'https://starbugs-qa.vercel.app'
    end

    def coffee_list
        return all('.coffee-item')
    end

    def buy(coffee_name)
        product = find('.coffee-item', text: coffee_name)
        product.find('.buy-coffee').click
    end
end