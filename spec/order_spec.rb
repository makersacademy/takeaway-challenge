require 'order'

describe Order do
  let(:dish1) { double(:dish, :name => "Baked Potato", :price => 3.25) }
  let(:dish2) { double(:dish, :name => "Spaghetti Bolognese", :price => 4.70) }
  let(:test_menu) { double(:menu, :dishes => [dish1, dish2]) }

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

end
