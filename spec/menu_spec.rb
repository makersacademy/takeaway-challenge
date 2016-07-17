require 'menu.rb'

describe Menu do
    
    it 'has an item list' do
        menu = Menu.new.dish_list
        expect(menu).to eq dish_list
    end    
    
end