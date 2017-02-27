require 'takeaway'
require 'order'
require 'text_message'


describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu, order: order) }
let(:menu) { double(:menu, to_string: printed_menu) }
let(:order) { instance_double("Order", total_amount: 4.00) }
let(:text_message) { instance_double("TextMessage", deliver: nil) }
let(:printed_menu) {"Yummy: £2.00"}
let(:items) { {Yummy: 1, Tasty: 2} }

    it 'shows the menu with items and prices' do
      expect(takeaway.show_menu).to eq(printed_menu)
      end

      before(:each) do
        allow(order).to receive(:add_item).twice
      end

    it 'can order some number of several items from the menu' do
      takeaway.place_order(items)
    end

    it'returns the total amount of the order' do
      total_amount = takeaway.place_order(items)
      expect(total_amount).to eq 4.00
    end

    it 'sends a text message when an order is placed' do
      takeaway.place_order(items)
      expect(text_message).to receive(:deliver)
    end

end
