require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, printing: printed_m) }
  let(:order) { double(:order) }
  let(:printed_m) { "Pizza: £10.99, Sandwich: £2.99" }
  let(:dishes_prices) { {pizza: 3, sandwich: 2, juice: 4} }

  it 'has the dishes and prices' do
    expect(takeaway.show_menu).to eq(printed_m)
  end

  it 'shows the dishes with prices' do
    printed_m = "Pizza: £10.99, Sandwich: £2.99"
    expect(menu.printing).to eq(printed_m)
  end

  it 'order some dishes' do
    expect(order).to receive(:add).thrice
    expect(takeaway.order_placed(dishes_prices)).to eq(dishes_prices)
  end

end
