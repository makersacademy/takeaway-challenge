require 'dish'

describe Dish do
  it 'creates a new dish instance with a name and a price' do
    katsu = Dish.new("katsu",2.5)
    expect(katsu).to be_a Dish
  end
end