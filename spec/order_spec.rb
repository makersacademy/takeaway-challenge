require 'order'

describe Order do
  let(:order) { described_class.new }

  it 'has no items when created' do
    expect(order.input).to eq []
  end

  it 'gets dish number as input' do
    allow_any_instance_of(order).to receive(:input).and_return("1")
    expect(order.dish_number).to eq(1)
  end

  it 'checks valid dish' do
    allow_any_instance_of(order).to receive(:input).and_return("1")
    expect(order).to be_valid_dish
  end

  it 'can add to cart' do
    order.cart(:name)
    expect(order.cart[:name]).to eq :cart
  end

  it 'has a quantity for a dish' do
    order.add(dish1, 4)
    expect(order.items.first[:quantity]).to eq 4
  end

  it 'has a total price' do
    order.add(dish1, 1)
    order.add(dish2, 1)
    expect(order.total_price).to eq 25.98
  end

  it 'has a total quantity' do
    order.add(dish1, 1)
    order.add(dish2, 2)
    expect(order.total_quantity).to eq 3
  end
end
