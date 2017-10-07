require 'order'

describe Order do
  let(:menu) { double(:menu) }
  let(:basket) { double(:basket) }
  subject(:order) { described_class.new(menu, basket) }


  it "#add_item" do
    expect(order).to respond_to(:add_item)
  end

  it "instantiates with a menu" do
    expect(order.order_menu).to eq(menu)
  end

  it "instantiates with a basket" do
    expect(order.order_basket).to eq(basket)
  end

end
