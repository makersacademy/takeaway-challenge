require 'dish'

describe Dish do
  
let(:dish) { Dish.new(2) } 
  
  it "should have a price" do
    expect(dish.price).to eq(2)
  end
end