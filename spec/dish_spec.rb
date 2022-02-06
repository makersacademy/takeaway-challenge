require "dish"

describe Dish do

  subject { Dish.new("pizza", 30, 8.00) }

  it "returns name and price of a dish" do
    expect(subject.view_price).to eq({ "pizza" => 8.00 })
  end

  it "returns name and quantity available of a dish" do
    expect(subject.view_qty_available).to eq({ "pizza" => 30 })
  end

  it "will return the price of a dish" do
    expect(subject.price).to eq 8.00
  end

end
