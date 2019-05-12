require 'dish'

describe Dish do
  let(:dish_name) { "burrito" }
  let(:dish_price) { 9.50 }
  let(:subject) { Dish.new(dish_name, dish_price) }

  it 'has a name' do
    expect(subject.name).to eq(dish_name)
  end

  it 'has a price' do
    expect(subject.price).to eq(dish_price)
  end
end
