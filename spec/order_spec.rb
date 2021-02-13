require 'order'

#potential for more functionality - adding several of one item at once.

describe Order do
  let(:dish1) { double(:dish, :name => "Baked Potato", :price => 3.25) }
  let(:dish2) { double(:dish, :name => "Spaghetti Bolognese", :price => 4.70) }
  let(:test_menu) { double(:menu, :dishes => [dish1, dish2], :pick => dish1) }

  let(:test_order) { described_class.new(test_menu) }

  describe '#initialize' do
    it 'has menu stored to menu attribute on initialization' do
      expect(test_order.menu).to eq test_menu
    end
    it 'has balance of zero' do
      expect(test_order.balance).to eq 0
    end
    it 'has empty list of dishes' do
      expect(test_order.dishes).to eq []
    end
    it 'is set to incomplete' do
      expect(test_order.complete).to be false
    end
  end

  describe '#add_item' do
    it 'adds a dish to the dishes array' do
      expect { test_order.add_item("Baked Potato") }.to change { test_order.dishes.length }.by 1
    end
    it 'throws an error if the order has already been completed' do
      test_order.complete_order
      expect { test_order.add_item(dish2)}.to raise_error "this order is closed"
    end
    it 'adds the price of the added item to the balance' do
      expect { test_order.add_item(dish1) }.to change { test_order.balance }.by 3.25
    end
  end

  describe '#complete_order' do
    it 'changes @complete from false to true' do
      expect { test_order.complete_order }.to change { test_order.complete }.to true
    end
  end

end
