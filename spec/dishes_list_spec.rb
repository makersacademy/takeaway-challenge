require 'dish_list'

describe DishList do
  let(:list) { DishList.new }
  let(:dish) { double("Dish") }

  it "creates an empty array of dishes upon initialisation" do
    expect(list.dish_list).to eq []
  end

  it "appents an object to the array of dishes" do
    expect(list.add_dish(dish).count).to eq 1
  end

  it "#to_s returns a string with an index number and the items in the dish_list array" do
    list.add_dish(dish)
    list.add_dish(dish)
    expect(list.to_s).to eq "1. #{dish}\n2. #{dish}"
  end
end
