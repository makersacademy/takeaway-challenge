require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }
  let(:dish) { double :dish }
  it 'responds to add a dish' do
    expect(subject).to respond_to(:add).with(2).argument
  end

  it 'expects to add to my the order' do
    subject.add(dish)
    expect(subject.order.length).to eq 1
  end

  it 'allows customer to order multiple amounts of a dish at once' do
    subject.add(dish, 5)
    expect(subject.order.length).to eq 5
  end
end
