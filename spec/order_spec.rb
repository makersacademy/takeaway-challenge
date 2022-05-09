require 'order'
require 'takeaway'

describe Ordermeal do
  it "is a class" do
    ordermeal = Ordermeal.new("Kebab", 2)
    expect(ordermeal).to eq 10
  end
end
