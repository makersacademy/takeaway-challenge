require "dish"

describe Dish do

  let(:price) { 4.99 }
  let(:name) { "Pepperoni pizza" }
  subject(:dish) { described_class.new(name, price) }

 describe "#name" do
   it "returns the name" do
     expect(dish.name).to eq name
   end
 end

 describe "#price" do
   it "returns the price" do
     expect(dish.price).to eq price
   end
 end



end
