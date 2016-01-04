require 'takeaway'

describe Takeaway do
  let(:order_klass) { double :order_klass, new: menu_klass, calculate: order }
  subject(:takeaway) {described_class.new(order_klass,menu_klass,phone_klass)}
  let(:order) { double :order, calculate_cost: 2}
  let(:total) { double :total => 6}
  let(:menu_klass) { double :menu_klass, new: nil, print: printed_menu }
  let(:printed_menu) { "Dish 1: £1" }
  let(:phone_number) { double :phone_number }
  let(:phone_klass) { double :phone_klass }

  describe '#view_menu' do
    it 'shows the menu with dishes and prices' do
      expect(takeaway.view_menu).to eq (printed_menu)
    end
  end

  describe '#create_order' do
    it 'creates a new instance of Order' do
      takeaway.create_order(menu_klass)
      expect(takeaway.order).not_to be_nil
    end
  end

  describe '#place_order' do
    before do
      allow(order).to receive(:each)
      takeaway.order_klass.calculate(order)
    end

    it 'raises an error if the total cost does not equal the sum of dishes' do
      expect{ takeaway.place_order(order, total, phone_number) }.to raise_error "Wrong total!"
    end

    it 'sends a text to confirm order' do
      allow(takeaway).to receive(:send_sms).and_return "Order SMS sent"

    end
  end

end
