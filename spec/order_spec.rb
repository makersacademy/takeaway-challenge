require 'order'

describe Order do
  subject(:order) { described_class.new }
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
end
