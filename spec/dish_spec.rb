require 'dish'

describe Dish do
  
  it "Takes and stores name and price when a new instance is created" do
    dish = Dish.new("Fries", 3.0)
    expect(dish).to have_attributes(:name => "Fries", :price => 3.0)
  end

end