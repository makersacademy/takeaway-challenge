require "order"

  describe Order do
    subject(:order) { described_class.new }

  it "should have an empty order" do
    expect(order.list).to eq []
  end

  it "can add a dish to the list" do
    order.choose("Burger")
    expect(order.list).to include("Burger")
  end
end

# subject(:menu) {Order.new(menu)}
# let(:menu) { double :menu, :menu => {Burger: 3, Hotdog: 2} }
