require 'takeaway'
require 'order'

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu, order: order) }
let(:menu) { double(:menu, to_string: printed_menu) }
let(:order) { instance_double("Order", total_amount: 4.00) }
let(:printed_menu) {"Yummy: £2.00"}
let(:items) { {Yummy: 1, Tasty: 2} }
  #context '#show_menu' do
    it 'shows the menu with items and prices' do
      expect(takeaway.show_menu).to eq(printed_menu)
      end
    #end
    it 'can order some number of several items from the menu' do
      expect(order).to receive(:add_item).twice
      takeaway.place_order(items)
    end

    it'returns the total amount of the order' do
      expect(order).to receive(:add_item).twice
      total_amount = takeaway.place_order(items)
      expect(total_amount).to eq 4.00
    end
end
