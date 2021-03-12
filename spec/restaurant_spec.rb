require 'restaurant'

describe Restaurant do
  let(:sparkleBurgers) { Restaurant.new('Sparkle Burgers')}

  it "initializes with a menu" do
    expect(sparkleBurgers.menu.kind_of?(Array)).to eq(true)
  end
end
