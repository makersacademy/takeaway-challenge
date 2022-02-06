require_relative '../lib/dish'

describe Dish do
  
  subject(:dish) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  #it "has a name of String" do
  #  expect(dish.name).to be_instance_of String
  #end
  #it "has a price of Float" do
  #  expect(dish.price).to be_instance_of Float
  #end
  
  it "the dish can receive 2 arguments for the name and price" do
    expect(Dish).to respond_to(:new).with(2).arguments
  end  

  it "the dish can receive 2 arguments for the name and price" do
    dish = Dish.new("Sweetcorn patties", 3.00)
    expect(dish.name).to eq "Sweetcorn patties"
    expect(dish.price).to eq 3.00
  end  

end
