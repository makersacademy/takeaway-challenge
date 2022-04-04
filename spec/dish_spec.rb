require 'dish'

describe Dish do

  it 'ensures dishes have info' do

    horrible_food = Dish.new("Pickles", 10)

    expect(horrible_food.info).to eq(["Pickles", 10])

  end
end
