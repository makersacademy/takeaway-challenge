require 'order_item'

describe OrderItem do
  subject { OrderItem.new(dish, quantity) }
  let(:dish) { double(:dish, name: 'Crabs', price: 20.0) }
  let(:quantity) { 5 }

  it 'is an instance of OrderItem' do
    expect(subject).to be_an_instance_of OrderItem
  end

  it 'has a dish' do
    expect(subject).to respond_to :dish
  end

  it 'has a quantity' do
    expect(subject).to respond_to :quantity
  end
end