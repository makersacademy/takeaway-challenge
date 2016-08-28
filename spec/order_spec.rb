require 'order.rb'
require 'menu.rb'

describe Order do
  let(:empty_order) {described_class.new(Menu.new)}
  let(:full_order) {described_class.new(Menu.new)}

  before(:each) do
    full_order.add_to_order("Chicken Tika", 2)
    full_order.add_to_order("Pizza", 4)
    full_order.add_to_order("Bangers & Mash", 3)
  end

  context '#add_to_order' do
    it 'addes a dish to the order' do
      order = Order.new(Menu.new)
      order.add_to_order("Chicken Tika", 1)
      expect(order.order).to eq({"Chicken Tika" => 1})
    end

    it 'does not let you add a dish to the order that is not on the menu' do
      expect{empty_order.add_to_order("DOG", 1)}.to raise_error(RuntimeError)
    end
  end

  context '#order_total' do
    it 'totals the bill correctly' do
      expect(full_order.order_total).to eq(48.91)
    end

    it 'returns 0 for an empty order' do
      expect(empty_order.order_total).to eq(0)
    end
  end

  context '#remove_from_order' do
    it 'removes food from an order' do
      full_order.remove_from_order("Bangers & Mash")
      expect(full_order.order).to eq({"Chicken Tika"=>2, "Pizza"=>4})
    end

    xit 'raises an error if you try to remove food not on the order' do
      #not sure if this is a necissary test.
    end
  end
end
