require 'order'

describe 'order' do

  subject(:order) { Order.new([:item1, :item2, 5]) }
  subject(:order_wrong_total) { Order.new([:item1, :item2, 5]) }

  it 'should initialize with the order details as an argument' do
    expect(Order).to respond_to(:new).with(1).argument
  end

  it 'should calculate the order total' do
    expect(order.total).to eq(5)
  end

  it 'should raise an error if the total is wrong' do
    expect{ Order.new([:item1, :item2, 6]) }.to raise_error 'Your totals don\'t match!'
    #expect{ oyster_card.touch_in(station) }.to raise_error 'Not enough balance'
  end

end
