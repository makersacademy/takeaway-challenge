require 'item'

describe Item do
  item_one_name = "name"
  item_one_price = "£5.00"
  let(:item_one) { described_class.new(item_one_name, item_one_price) }

  it "name exists" do
    expect(item_one.name).to eq item_one_name
  end

  it "price exists" do
    expect(item_one.price).to eq item_one_price
  end

  it "is available" do
    expect(item_one).to be_available
  end
end
