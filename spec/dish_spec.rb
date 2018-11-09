require 'dish'

describe Dish do
  let(:rogan_josh) {Dish.new("rogan josh", 400)}

  it "name tells you the dishes name" do
    expect(rogan_josh.name).to eq("rogan josh")
  end

  it "price tells you the dishes price" do
    expect(rogan_josh.price).to eq(400)
  end
end
