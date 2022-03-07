require "dish"

describe Dish do
  
  it "should be able to take two arguments name and price of a dish" do
    expect do
      cheeseburger = Dish.new("Cheeseburger Meal", 5)
    end.not_to raise_error
  end
    
  # Lets create a dish called cheeseburger
  cheeseburger = Dish.new("Cheeseburger Meal", 5)

  it "should record the name of the dish" do
    expect(cheeseburger.name).to eq("Cheeseburger Meal")
  end

  it "should record the name of the dish" do
    expect(cheeseburger.price).to eq(5)
  end

end

