require "dish"

describe Dish do
  subject { Dish.new("burger", 10) }
  
  it "returns name and price of dish" do
    expect(subject.view).to eq({ "burger" => 10 })
  end

  it "returns price of dish" do
    expect(subject.price). to eq 10
  end
end
