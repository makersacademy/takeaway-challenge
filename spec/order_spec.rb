require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:print_menu_class) { double :print_menu_class }

  it { expect(order.current_order).to be_empty }

  describe '#add_order' do
    it 'adds beef fried rice to current order' do
      allow(print_menu_class).to receive(:select_dish).and_return({dish: "Beef Fried Rice", price: 5})
      order.add_order(2, 1)

      expect(order.current_order).to eq([{dish: "Beef Fried Rice", price: 5}])
    end

    it 'adds two Lemon Chicken to current order' do
      allow(print_menu_class).to receive(:select_dish).and_return({dish: "Lemon Chicken", price: 6})
      order.add_order(4, 2)

      expect(order.current_order).to eq([{dish: "Lemon Chicken", price: 6}, {dish: "Lemon Chicken", price: 6} ])
    end
  end

  describe '#remove_order' do
    it 'removes an order of Lemon Chicken from current_order' do
      order.add_order(4, 1)

      expect(order.remove_order("Lemon Chicken")).to eq({dish: "Lemon Chicken", price: 6})
    end
  end
end
