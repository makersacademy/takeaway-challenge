require 'dishes'

describe Dishes do

  dishes = Dishes.new("Salmon", 15)

  it "stores dish names" do
    expect(dishes.dish_name).to eq("Salmon")
  end

  it "stores dish prices" do
    expect(dishes.dish_price).to eq(15)
  end
end
