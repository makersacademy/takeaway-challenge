require 'order'

RSpec.describe Order do
  
  before(:each) do
    @dish = double(:dish)
    @menu = double(:menu)
    allow(@menu).to receive(:display).and_return({@dish => 10})
    @order = Order.new(@menu)
  end

  it "Adds dishes and quantities to the basket" do
    @order.take(@dish)
    expect(@order.display).to eq("#{@dish} x 1 = £10")
  end

  it "takes an order and makes an array with items, quantities and price" do
    @order.take(@dish)
    expect(@order.basket_with_prices).to eq([[@dish, 1, 10]])
  end

  it "takes and order and updates basket accordingly" do
    @order.take(@dish)
    expect(@order.basket).to eq([[@dish, 1]])
  end
end