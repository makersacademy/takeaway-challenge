require 'dish'

describe 'Dish' do

  let(:dish) {Dish.new('Tasty Tofu',1.50)}

  it 'has a name' do
    expect(dish.name).to eq 'Tasty Tofu'
  end

  it 'has a price' do
    expect(dish.price).to eq 1.50
  end

  it 'has an order quantity' do
    expect(dish.quantity).to eq 0
  end

  it 'can have its quantity set' do
    dish.set_quantity(3)
    expect(dish.quantity).to eq 3
  end

  it 'can increase quantity by one with .add' do

    dish.add
    expect(dish.quantity).to eq 1

  end


end