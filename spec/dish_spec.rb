require 'dish'

describe Dish do
  let(:dish) { described_class.new 'Cod', 4 }
  dish_hash = { 'Cod' => 4 }

  it 'has a name' do
    expect(dish.name).to eq 'Cod'
  end

  it 'has a price' do
    expect(dish.price).to eq 4
  end

  it 'can be expressed as a hash' do
    expect(dish.details).to eq dish_hash
  end
end
