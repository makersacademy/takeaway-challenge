require 'food'

describe Food do
  it "creates with a unique menu ID" do
    expect(Food.new('', 0).id).to eq(1)
    expect(Food.new('', 0).id).to eq(2)
    expect(Food.new('', 0).id).to eq(3)
  end

  it "initializes with the correct name and price" do
    sample_item = Food.new("Chicken", 5)
    expect(sample_item.item_name).to eq("Chicken")
    expect(sample_item.item_price).to eq(5)
  end
end