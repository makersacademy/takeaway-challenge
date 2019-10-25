require "dish"

describe Dish do
  subject(:dish) { Dish.new }

  it "should be instance of class dish" do
    expect(:dish).to be_kind_of Dish
  end
end
