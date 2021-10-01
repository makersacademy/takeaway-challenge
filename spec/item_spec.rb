require 'item'

describe Item do
  item_one_name = "name"
  item_one_price = "£5.00"
  let(:item_one) { described_class.new(item_one_name, item_one_price) }


  it "has a name" do
    expect(item_one.name).to eq item_one_name
  end

  it "has a price" do
    expect(item_one.price).to eq item_one_price
  end
end
