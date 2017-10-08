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
end
