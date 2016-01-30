require 'order'

describe Order do

  subject(:order) { described_class.new }

  it 'has an order class' do
    expect(order).to be_a Order
  end

end
