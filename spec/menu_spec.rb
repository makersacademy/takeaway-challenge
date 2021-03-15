require './lib/menu.rb'

describe Menu do
    it 'has a list of dishes and prices' do
        test_menu = Menu.new
        expect(test_menu.menu).to eq ({ 'Shio Ramen' => 5.50, 'Shoyu Ramen' => 6, 'Miso Ramen' => 7, 'Spicy Ramen' => 8 })
    end
end