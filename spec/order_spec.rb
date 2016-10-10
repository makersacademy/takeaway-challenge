require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:burrito) { double :burrito, keys: ["burrito"] }

  it 'adds items to the basket' do
    expect(order.add_dish(burrito, 2)).to eq "2x #{burrito.keys[0]}(s) added to your basket"
  end

  it 'raises an error when trying to view the contents of an empty basket' do
    expect {order.view_basket}.to raise_error 'Basket empty'
  end

  it 'raises an error when trying to view the cost of an empty basket' do
      expect {order.view_cost}.to raise_error 'Total cost £0: basket empty'
  end
  # 
  # it 'allows you to view the contents of the basket' do
  #
  # end
  #
  # it 'allows you to view the cost of the current basket' do
  #
  # end

end
