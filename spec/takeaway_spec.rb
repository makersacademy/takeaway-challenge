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

  it {is_expected.to respond_to(:menu)}

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
end
