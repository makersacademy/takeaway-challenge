require 'dish'

RSpec.describe Dish do
  let(:test_dish) { Dish.new(:pepperoni_pizza, 8) }

  it 'has a name' do
    expect(test_dish.name).to be :pepperoni_pizza
  end

  it 'has a price' do
    expect(test_dish.price).to be 8
  end
end
