require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  context 'menu' do
    it 'menu has a list of food items' do
      expect(menu.items).to eq []
    end

    it 'can add food items to the list' do
      food = "Fish soup"
      price = 4.99
      expect(menu.add_to_menu(food,price)).to eq [{food => price}]
    end
  end
end
