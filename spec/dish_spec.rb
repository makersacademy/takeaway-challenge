require "dish"

describe Dish do
  let(:dish) { Dish.new }

  it "creates a instance of Dish" do
    expect(dish).to be_instance_of(Dish)
  end

  # it "initializes with a hash of dishes " do
  #  expect(dish.dishes).to be_a(Hash)
  #end
end
