require "Takeaway"
describe Takeaway do
  it "allow you to read menu" do
    takeaway = double("menu", dish: "Chicken", price: 4.99)
    expect(takeaway.dish).to eq("Chicken")
    expect(takeaway.price).to eq(4.99)
  end 
  it "allow you to order" do
    expect(takeaway.order).to eq(true)
  end 
end
