require 'order'
require 'menu'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu) }
  it "can calculate the total cost of the order" do
    expect(order).to respond_to(:total)
  end
  it "records the quantity of each dish ordered" do
    expect(order).to respond_to(:quantity).with(1).argument
  end
  it "returns a list of dishes in the order" do
    expect(order).to respond_to(:list_dishes)
  end

  describe "#total" do
    let(:dish) { double :dish, quantity: 2, to_sym: :dish}
    let(:menu) { double :menu, cost: 5}
    it "returns an order total of 10 for two 5 pound dishes ordered" do
      dishes = [{dish => 2}]
      test_order = Order.new(dishes, menu)
      expect(test_order.total).to eq 10
    end
  end
  describe "#add" do
    it "adds dishes to the order" do
      expect(order).to respond_to :add
    end
  end
end
