require 'order.rb'
require 'menu.rb'

describe Order do
  let(:full_order) {Order.new; add_to_order}
  let(:menu) {double(Menu.new)}
  let(:chicken_tika) {double :chicken_tika}
  let(:available_dish) {double :available_dish}
  let(:unavailable_dish) {double :unavailable_dish}
  let(:dish) {double(:dish)}

  before(:each) do
    allow(chicken_tika).to receive(:dish_price).and_return(7.99)
    allow(chicken_tika).to receive(:quantity).and_return(8)

    allow(unavailable_dish).to receive(:dish_available?).and_return(false)
    allow(available_dish).to receive(:dish_available?).and_return(true)
  end

  context '#order_total' do
    it 'totals the bill correctly' do
      subject.add_to_order(chicken_tika, 2)
      expect(subject.order_total).to eq(7.99 * 2)
    end

    it 'returns 0 for an empty order' do
      expect(subject.order_total).to eq(0)
    end
  end

  context '#add_to_order' do
    it 'addes a dish to the order' do
      subject.add_to_order("Chicken Tika", 2)
      expect(subject.order).to eq({"Chicken Tika" => 2})
    end

    it 'does not let you add more to the order than there are availalbe' do
      expect{subject.add_to_order("Chicken Tika", 40)}.to raise_error
    end
  end

  context '#remove_from_order' do

    it 'removes food from an order' do

    end

  end
end
