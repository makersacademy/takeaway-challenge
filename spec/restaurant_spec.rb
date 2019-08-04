require 'order'
require 'menu'
require 'restaurant'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15.50) }
  let(:sms) { double(:sms, deliver: nil) }
  let(:printed_menu) { 'Chicken: £3.50' }

  let(:dishes) { { chicken: 2, fish: 1 } }

  before do
    allow(order).to receive(:add)
  end

  # Has a menu with a list of dishes and prices

  it { expect(takeaway.print_menu).to eq(printed_menu) }

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do 
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it 'sends a message when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
  
end 