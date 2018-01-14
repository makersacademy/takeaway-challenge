require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }
  let(:menu) { double(:menu, printing: printed_m) }
  let(:order) { double(:order, total_amount: 20) }
  let(:printed_m) { "Pizza: £10.99, Sandwich: £2.99" }
  let(:dishes_prices) { {pizza: 3, sandwich: 2, juice: 4} }
  let(:sms) { double(:sms, delivered: nil) }

  before do
      allow(order).to receive(:add)
  end

  it 'has the dishes and prices' do
    expect(takeaway.show_menu).to eq(printed_m)
  end

  it 'shows the dishes with prices' do
    printed_m = "Pizza: £10.99, Sandwich: £2.99"
    expect(menu.printing).to eq(printed_m)
  end

  it 'order some dishes' do
    expect(order).to receive(:add).thrice
    takeaway.order_placed(dishes_prices)
  end

  it 'shows the order\'s total amount' do
    # allow(order).to receive(:add)
    total_amount = takeaway.order_placed(dishes_prices)
    expect(total_amount).to eq(20)
  end

  it 'sends an SMS when order placed' do
    expect(sms).to receive(:delivered)
    takeaway.order_placed(dishes_prices)
  end

end
