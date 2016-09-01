require 'order'

describe Order do

  subject(:order) { described_class.new }

  it 'should add an order to a hash' do
    order.add_order(:fries,2)
    expect(order.basket).to include({:fries=>2})
  end

end
