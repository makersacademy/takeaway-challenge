require 'order'

describe Order do
  subject(:order) { described_class.new(:customer, :restaurant) }
  let(:restaurant) { Restaurant.new(:menu) }
  let(:menu) { Menu.new }
  let(:fish) { Dish.new("Cod",14.99) }
  let(:steak) { Dish.new("Steak",24.99) }

  describe '#customer' do
    it 'orders have customers' do
      expect(order.customer).to eq(:customer)
    end
  end

  describe '#show_menu' do
    it 'should show the menu' do
      allow(restaurant).to receive(:show_menu).and_return("Cod - £14.99")
      expect(order.show_menu).to eq("Cod - £14.99")
    end
  end

  describe '#add_to_order' do
    it 'should add items to order' do
      allow(restaurant).to receive(:order_item).and_return({"Cod" => 14.99})
      order.add_to_order("Cod", 2)
      # order.add_to_order("Steak", 3)
      expect(order.order).to contain_exactly({"Cod" => 14.99,"Cod" => 14.99})
    end
  end

  describe '#order' do
    it 'orders start off empty' do
      expect(order.order).to be_empty
    end
  end
end
