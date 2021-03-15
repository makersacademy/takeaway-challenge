require 'order'
require 'dish'

describe Order do

  it 'starts with an empty collection' do
    expect(subject.dishes).to be_empty
  end

  it 'records the time an order is to be delivered' do
    subject.complete
    expect(subject.delivery_time).to be_a_kind_of(String)
  end

  it 'can verify the total price of all dishes in an order' do
    subject.dishes.push(Dish.new("name", 5))
    subject.dishes.push(Dish.new("name", 5))
    expect(subject.verify_total).to eq(10)
  end

  it 'has a delivery time when the order is complete' do
    subject.complete
    expect(subject.delivery_time).to_not eq(nil)
  end

end
