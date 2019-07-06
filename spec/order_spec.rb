require 'order'
require 'dish'
require 'menu'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu) }
  it "adds a dish to the order" do
    expect(order).to respond_to(:choose).with(1).argument
  end
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
    let(:dish) { double :dish, quantity: 2}
    let(:menu) { double :menu, price: 5}
    it "returns an order total of 10 for two 5 pound dishes ordered" do
      dishes = [dish]
      test_order = Order.new(dishes, menu)
      expect(test_order.total(menu)).to eq 10
    end
  end
end
