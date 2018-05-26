require './lib/menu.rb'

describe Menu do

  subject(:menu) { described_class.new }

  context 'default #initialization' do
    it 'can create a menu' do
      expect { Menu.new }.not_to raise_error
    end
    it 'responds to a method for viewing dishes with prices' do
      expect { menu.dishes }.not_to raise_error
    end
  end

  context '#dishes' do
    it 'contains a list of dishes with prices on initialization' do
      expect(menu.dishes).to include({ "Chicken Tikka" => 8.99 })
      expect(menu.dishes).to include({ "Dry Meat" => 10.99 })
      expect(menu.dishes).to include({ "Garlic Naan" => 3.49 })
    end
  end

  context '#display' do
    it 'displays the dishes available for order' do
      expect(menu.display).to include(menu.dishes.to_s)
    end
    it 'displays the dishes in the context of a menu' do
      expect(menu.display).to match "Ty Abs - Whitechapel
Takeaway Menu
#{menu.display_menu}
Please order before 10pm
Delivery is available in the E2 area"
    end
  end
end
