require 'takeaway'
require 'dotenv'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double('Order', total: 20.00) }
  let(:sms) { instance_double('SMS', deliver: nil) }
  let(:printed_menu) { 'Congee £5.00' }
  
  let(:dishes) { { congee: 2, wonton: 1 } }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number od several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the total order' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(20)
  end

  it 'sends and SMS when order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
