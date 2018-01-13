require './lib/order.rb'

describe Order do
  subject(:order) { described_class.new(menu)}

  let(:dishes_prices) { { pizza: 3, sandwich: 4} }
  let(:menu) { double(:menu) }

 before do
  allow(menu).to receive(:includes_dish?).with(:pizza).and_return(true)
  allow(menu).to receive(:includes_dish?).with(:sandwich).and_return(true)
end

  it 'can take some dishes with prices' do
    order.add(:pizza, 3)
    order.add(:sandwich, 4)
    expect(order.dishes_prices). to eq(dishes_prices)
  end

  it 'can\'t add dishes not on the menu' do
    allow(menu).to receive(:includes_dish?).with(:pork).and_return(false)
    expect { order.add(:pork, 1) }. to raise_error "Pork not on the menu, can't be selected."
  end
end
