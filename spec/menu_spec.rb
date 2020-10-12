require 'menu'

describe Menu do
  let(:new_menu) { Menu.new }
  
  describe '#initialize' do
    it 'loads the menu' do
      expect(new_menu.menu).to eq([{ item: "Quiche", price: 3 }, { item: "Mac & Cheese", price: 6 }, { item: "Mashed Potatoes", price: 2 }, { item: "Tea", :price => 1 }, { item: "Tiramisu", price: 5 }])
    end
  end

  describe '#print_menu' do
    it 'prints the menu' do 
      french_menu = Menu.new("menu_2.csv")
      expect { french_menu.print_menu }.to output("Ratatoulle ~ £15\n").to_stdout
    end
  end

  describe '#find_price()' do
    it 'returns the price of an item' do 
      expect(new_menu.find_price('mashed Potatoes')).to eq 2
    end
  end
end
