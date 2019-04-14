require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { {
    "Chicken bits" => 5,
    "Burger" => 5,
    "Pizza" => 8,
    "Chips" => 3
  } }
  let(:order) { Order.new }
  let(:message) { instance_double("MESSAGE", deliver: nil) }
  it { is_expected.to respond_to(:menu) }

  describe '#print_menu' do
    it 'prints a menu when called' do
      expect(subject.print_menu).to eq(printed_menu)
    end
  end

  describe '#add_item' do
    it 'add an item to an order' do
      expect(subject.add_item("item", 2)).to eq(order.add("item", 2))
    end
  end

  # describe '#view_order' do
  #   it 'includes the current order summary' do
  #     allow(subject.view_order).to receive @order.order_summary
  #   end
  # end

  # describe '#confirm_order' do
  #   it 'sends a text when order is confirmed' do
  #     expect(message).to receive(:deliver)
  #     subject.confirm_order
  #   end
  # end
end
