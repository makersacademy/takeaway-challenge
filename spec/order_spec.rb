require_relative '../lib/order'
require_relative '../lib/menu'

describe Order do

  let(:menu) { double :menu }
  let(:order) { Order.new(menu) }
  
  it 'should add chosen dishes to order' do
    order.add(:pizza)
    expect(order.dishes).to include(:pizza)
  end

end