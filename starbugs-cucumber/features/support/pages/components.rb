class Popup
    #O método visit funciona no Capybara, mas o cucumber não sabe que existe uma camada personalizada (pages). O comando abaixo deixa claro que você quer usar todos os recursos do Capybara dentro dessa classe
    include Capybara::DSL
    include RSpec::Matchers

    def have_text(text)
        popup_msg = find('.swal2-html-container')
        expect(popup_msg.text).to eql text
    end
end