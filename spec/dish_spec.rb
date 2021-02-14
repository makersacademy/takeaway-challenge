require_relative '../docs/lib/dish' 

describe Dish do 
  let(:dish) { Dish.new(1, "Pad Thai", 5.50)}
  
  it "contains a name" do 
    expect(dish.name).to eq("Pad Thai")
  end 
  it "contains a cost" do 
    expect(dish.cost).to eq(5.50)
  end 
  it "contains the menue number" do 
    expect(dish.menue_number).to eq(1)
  end 
  
end 