require 'order'

describe Order do
  let(:menu) { double(:menu) }
  let(:basket) { double(:basket) }
  subject(:order) { described_class.new(menu, basket) }


  describe "#add_item" do
    it "exists" do
    expect(order).to respond_to(:add_item)
    end

    it "accepts user input for item_num and item_quant" do
      allow($stdin).to receive(:gets).and_return("1\n","2\n")
      expect($stdin).to receive(:gets).twice
      order.add_item
    end
  end

  it "instantiates with a menu" do
    expect(order.order_menu).to eq(menu)
  end

  it "instantiates with a basket" do
    expect(order.order_basket).to eq(basket)
  end

end
