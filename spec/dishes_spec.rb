require 'dishes'


describe Dishes do
    let(:dishes) { described_class.new :pizza, 9 }
  it "returns the name of a dish" do
    expect(dishes.dish_name).to eq(:pizza)
  end

  it "returns the price of a dish" do
    expect(dishes.price).to eq(9)
  end
end
