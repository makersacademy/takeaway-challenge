require 'dish'

describe Dish do
  
let(:dish) { Dish.new(2, 'dish') } 

  it "should have a name" do
    expect(dish.name).to eq('dish')
  end
  
  it "should have a price" do
    expect(dish.price).to eq(2)
  end
end