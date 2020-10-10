require 'item'

describe Item do
  subject(:item) { described_class.new("Blini", 7) }

  it "has a name" do
    expect(item.name).to eq("Blini")
  end

  it "has a price" do
    expect(item.price).to eq 7
  end
end
