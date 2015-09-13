require 'menu'

describe Menu do

  it "contains dishes and prices" do
    expect(subject.dishes).to be_a Hash
  end

  it "gives the price of a dish" do
    expect(subject.price["Papadom"]).to eq(1)
  end

end