require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: "fried chicken", price: 7.5, quantity: 2 }

  it 'allows to add dish to order list' do
    expect(order.add_dish(:dish, 2)).to eq 2
  end



end
