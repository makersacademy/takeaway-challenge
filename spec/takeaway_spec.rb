require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }

  let(:menu) { double(:menu, print: printed_menu)}
  let(:order) { double(:order, total: 43.50) }
  let(:sms) {double(:sms, deliver: nil)}
  let(:printed_menu) { 'Eggs $1.50'}

  let(:dishes) { {eggs: 5, milk: 5} }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order a number of dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'can work out the total price' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(43.50)
  end

  it 'sends an SMS when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
