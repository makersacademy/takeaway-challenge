require 'menu.rb'

describe Menu do

    it 'it shows a list of dishes with prices' do
        menu = Menu.new
        expect(menu.dishes.is_a?(Hash)).to be_truthy
    end

end