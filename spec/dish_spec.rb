require 'dish'

describe Dish do
  let(:carbonara) { Dish.new("Carbonara", 5) }

  it "has a name" do
    expect(carbonara.name).to eq "Carbonara"
  end

  it "has a price" do
    expect(carbonara.price).to eq 5
  end

end
