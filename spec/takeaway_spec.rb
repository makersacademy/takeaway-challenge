require 'takeaway'

describe Takeaway do
# injected menu, order & sms into takeaway class
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }
# doubles set up
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 27.97) }
  let(:sms) { double(:sms, deliver: nil) }
  let(:printed_menu) { "Lasagne: £8.99" }
# test dishes
  let(:dishes) { { lasagne: 2, ratatouille: 1 } }

  before do
    allow(order).to receive(:add)
  end

  it 'shows menu dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
# using method .twice for the first time. Source: Rspec mocks
  it 'can order some number of dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(27.97)
  end

  it 'sends an sms when order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
