require 'dish'

# list of dishes with prices shown to customer
describe Dish do
  dish = Dish.new("pizza", 8.00)
  it "gets the price of the dish" do
    expect(dish.price).to eq 8.00
  end
  
  it "returns the name of the dish" do
    expect(dish.name).to eq "pizza"
  end
end
