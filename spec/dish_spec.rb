require 'dish'

describe Dish do
  let(:dish) { Dish.new("Pizza", "5") }
  # wrote tests for coverage
  it 'has a name and price' do
    expect(dish).to respond_to(:name)
    expect(dish).to respond_to(:price)
    expect(dish).to respond_to(:available)
  end

end
