require_relative '../lib/order'
require_relative '../lib/menu'

describe Order do
  let(:menu) { double :menu }
  let(:order) { Order.new(menu) }

  before do
    allow(menu).to receive(:dish_available?).with(:pizza).and_return(true)
  end
  
  it 'should add chosen dishes to order' do
    order.add(:pizza, 1)
    expect(order.dishes).to include(:pizza)
  end

  it 'should add more than one of each dish' do
    order.add(:pizza, 2)
    dishes = { :pizza => 2 }
    expect(order.dishes).to eq dishes
  end

  it 'should raise error if dish not available' do
    allow(menu).to receive(:dish_available?).with(:burger).and_return(false)
    expect { order.add(:burger, 1) }.to raise_error("Apologies, burger is not available")
  end

  it 'should check total bill' do
    allow(menu).to receive(:price).with(:pizza).and_return(5.00)
    order.add(:pizza, 2)
    total = 10.00
    expect(order.bill(:pizza, 2).sum).to eq total
  end
end
