require 'takeaway_menu'

describe TakeawayMenu do

  let(:dish1) { double :dish1, name: 'Classic Burger', price: 5 }
  let(:dish2) { double :dish2, name: 'Steak', price: 10 }
  let(:dish3) { double :dish3, name: 'Milkshake', price: 3 }

  it 'makes a new menu' do
    expect(TakeawayMenu).to respond_to(:new)
  end

  describe '#view_menu' do
    dish_menu = TakeawayMenu.new
    before { dish_menu.add(dish1); dish_menu.add(dish2); dish_menu.add(dish3) }

    it 'returns a list of dishes with prices' do
      expect(dish_menu.view_menu).to eq ["Classic Burger - 5", "Steak - 10", "Milkshake - 3"]
    end
  end

end
