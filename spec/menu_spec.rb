require 'menu.rb'

describe Menu do

    let(:menu) { Menu.new }

    it 'has menu' do
        expect(menu.restaurant_menu).to eq Menu::RESTAURANT_MENU
    end

    it 'shows the price of an item' do
        menu.price('pizza')
        expect(menu.price('pizza')).to eq 10
    end

    it 'prints the entire menu' do
        menu.printed_menu
        expect(menu.printed_menu).to eq ["chips", 2, "pizza", 10]
    end
end