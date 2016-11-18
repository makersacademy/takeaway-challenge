require 'food'

describe Food do
  subject(:pizza) { described_class.new(:pizza, 10) }
  it "should have a name" do
    expect(pizza.name).to eq :pizza
  end

  it "should have a price" do
    expect(pizza.price).to eq 10
  end
end
