require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  it 'It is a object restaurant' do
    expect(restaurant).to be_an(Object)
  end
  it 'Should respond to #amend_name' do
    expect(restaurant).to respond_to(:amend_name).with(1).argument
  end
  it 'Should respond to #create order' do
    expect(restaurant).to respond_to(:create_order).with(3).argument
  end
  it 'Should respond to #complete order' do
    expect(restaurant).to respond_to(:complete_order)
  end
  it 'Check name of the restaurant' do
    expect(restaurant.amend_name("Love Plants")).to eq(restaurant.name)
  end
  it 'Create order' do
    expect(restaurant.create_order('Street 12, New York, 12345', "01234567890", ["Tomato soup", 2], ["Mini pizza", 1])).to eq(restaurant.order)
  end
  it 'Complete the order' do
    restaurant.create_order('Street 12, New York, 12345', "01234567890", ["Tomato soup", 2], ["Mini pizza", 1])
    expect(restaurant.complete_order).to eq(restaurant.orders_history)
  end
end
