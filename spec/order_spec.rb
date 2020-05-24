require_relative '../lib/order'
require_relative '../lib/menu'

describe Order do

  let(:menu) { double :menu }
  let(:order) { Order.new(menu) }

  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
  end
  
  it 'should add chosen dishes to order' do
    order.add(:pizza)
    expect(order.dishes).to include(:pizza)
  end
  it 'should raise error if dish not available' do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(false)
    expect { order.add(:burger) }.to raise_error("Apologies, burger is not available")
  end

end