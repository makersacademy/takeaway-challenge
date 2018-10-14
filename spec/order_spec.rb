require "order"

  describe Order do
    let(:menu) { double :menu, :menu => {Burger: 3, Hotdog: 2} }
    subject(:order) { described_class.new }

  it "should have an empty order" do
    expect(order.list).to be_empty
  end

  it "can add a number of dishes to the list" do
    order.choose("Burger", 1)
    expect(order.list).to include({num: 1, name: "Burger"})
  end

  it "finds the prices of selected items" do
    order.choose("burger",1)
    order.choose("Hotdog",1)
    p order.order
    expect(order.price).to eq 5
  end
end

# subject(:menu) {Order.new(menu)}
