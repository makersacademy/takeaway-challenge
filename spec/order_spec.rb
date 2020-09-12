require 'order'

describe Order do

  subject(:order) { Order.new }

  it 'initalises with an empty basket' do
    expect(order.basket).to eq []
  end
end