require 'order'

describe Order do
  subject(:order) { described_class.new }
  it "adds a dish to the order" do
    expect(order).to respond_to(:choose).with(1).argument
  end
end
