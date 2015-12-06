require 'takeaway'

describe Takeaway do
  let(:order_klass) {
    double :order_klass, new: menu_klass, calculate_quantities: order,
    calculate_cost: order, calculate: order
  }
  subject(:takeaway) { described_class.new(order_klass) }
  let(:order) {
    double :order, inject: [["Dish 1" => 5.00]],
    length: 4, each: nil, calculate_cost: 5
  }
  let(:quantity) { double :quantity => 4}
  let(:total) { double :total => 8}
  let(:menu_klass) { double :menu_klass, new: nil }
  let(:menu) { double :menu }
  let(:number) { double :number }

  describe '#new_order' do
    it 'creates a new Order' do
      takeaway.new_order(menu_klass)
      expect(takeaway.order).not_to be_nil
    end
  end

  describe '#place_order' do
    before do
      allow(order).to receive(:each)
      takeaway.order_klass.calculate(order)
    end

    it 'raises an error if the total given does not match the dishes total' do
      expect{ takeaway.place_order(order, quantity, total, number) }
        .to raise_error "Wrong total!"
    end

    it 'sends a text to confirm an order' do
      allow(takeaway).to receive(:send_sms).and_return "Order SMS sent"

    end
  end

end
