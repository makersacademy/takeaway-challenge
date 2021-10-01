require 'item'

describe Item do
  item_name = "name"
  item_price = "£5.00"
  let(:item) { described_class.new(item_name, item_price) }

  it "has a name" do
    expect(item.name).to eq item_name
  end

  it "has a price" do
    expect(item.price).to eq item_price
  end
end
