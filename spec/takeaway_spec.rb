require 'takeaway'
require 'message'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, message: message) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:order) { instance_double("Order", total: 13) }
  let(:message) { instance_double("Message", deliver: nil) }
  let(:printed_menu) { "Pancakes: £4" }

  let(:dishes) { {steak: 1, fish: 2, chips: 2} }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with list of dishes and prices' do
    expect(takeaway.show_menu).to eq(printed_menu)
  end

  it 'can select a number of several available dishes' do
    expect(order).to receive(:add).exactly(3).times
    takeaway.place_order(dishes)
  end

  it 'knows the total for order' do
    expect(takeaway.place_order(dishes)).to eq(13)
  end

  it 'sends a message with delivery time after order is placed' do
    expect(message).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
