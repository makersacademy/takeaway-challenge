require 'order_item'

describe OrderItem do
  let(:order_item) { described_class.new("1 2") }
  it "stores the dish number" do
    expect(order_item.dish_number).to eq "1"
  end
  it "stores the quantity" do
    expect(order_item.quantity).to eq "2"
  end
  it "calculates the item cost" do
    expect(order_item.cost).to eq 16
  end
end
