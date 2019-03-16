require 'dish'

describe Dish do

  it "adds price to a dish" do
    dish = Dish.new("Chicken Noodles", 5.49)
    expect(dish.price).to eq(5.49)
  end

  it "adds name to a dish" do
    dish = Dish.new("Chicken Noodles", 5.49)
    expect(dish.name).to eq("Chicken Noodles")
  end
end

#   it "receives a dish name as instance variable" do
#     expect(dish).to have_attributes(:name)
#   end
# end
