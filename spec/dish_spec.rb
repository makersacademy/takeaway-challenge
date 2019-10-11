require 'dish'
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Dish do
  dish = Dish.new("Tuna Tartare", 9.00)
  it "gets the price of a dish" do
    expect(dish.price).to eq 9.00
  end
  it "returns the name of a dish" do
    expect(dish.name).to eq "Tuna Tartare"
  end
end
