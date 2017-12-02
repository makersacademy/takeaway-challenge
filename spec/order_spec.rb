require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double :dish, name: "Chow Mein", price: 5}

  it "allows customers to start with an empty basket" do
    expect(order.items).to be_empty
  end

  it "allows customers to add dish" do
    order.add_dish(dish, 1)
    expect(order.items[dish]).to eq 1
  end
end
