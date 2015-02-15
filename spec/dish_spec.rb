require 'dish'

describe Dish do
  
  it "should be created with a name" do
    sandwich = Dish.new("Sandwich")
    salad = Dish.new("Salad")
    expect(sandwich.name).to eq "Sandwich"
    expect(salad.name).to eq "Salad"
  end

end