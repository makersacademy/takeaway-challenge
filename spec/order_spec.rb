require 'order'

describe Order do
  subject(:good_order) { described_class.new(good_restaurant_menu) }
  subject(:bad_order) { described_class.new(good_restaurant_menu) }
  let(:good_restaurant_menu) { double :menu, dishes: [item1], has_item?: true }
  let(:bad_restaurant_menu) { double :menu, dishes: [item2], has_item?: false }
  let(:item1) { double :item, name: "Pizza", price: 5.00 }
  let(:item2) { double :item, name: "Fries", price: 1.99 }

  describe '#new' do
    it "Initializes with an empty hash and argument menu" do
      expect(good_order.ordered).to be_empty
      expect(good_order.menu).to eq good_restaurant_menu
    end
  end

  describe '#add' do
    it "Adds an item on the menu to order hash" do
      good_order.add(item1, 1)
      expect(good_order.ordered).to include({"Pizza" => [5.0, 1]})
    end
  end

  describe '#total' do
    it "Multiples prices by quantity of each order and adds them together" do
      good_order.add(item1, 7)
      good_order.add(item2, 5)
      expect(good_order.total).to eq "£44.95"
    end
  end

  describe '#receipt' do
    it "Returns a text representation of the order" do
      message = "Order: Pizza, £5.0 x x7 = £35.0 \nFries, £1.99 x x5 = £9.95 \nTotal Price: comes to £44.95"
      good_order.add(item1, 7)
      good_order.add(item2, 5)
      expect(good_order.receipt).to eq message
    end
  end
end
