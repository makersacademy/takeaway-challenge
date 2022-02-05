require "dish"

describe Dish do

  subject { Dish.new("pizza", 8) }

  it "returns name and price of a dish" do
    expect(subject.view).to eq({ "pizza" => 8 })
  end

end
