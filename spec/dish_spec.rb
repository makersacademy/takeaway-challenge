require_relative '../lib/dish'

describe Dish do
  
  subject(:dish) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  it "has a name of String" do
    expect(dish.name).to be_instance_of String
  end
  it "has a price of Float" do
    expect(dish.price).to be_instance_of Float
  end

end
