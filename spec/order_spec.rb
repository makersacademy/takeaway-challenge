require 'order'
require 'menu'

describe Order do

  before (:each) do
    @menu = double(:menu)
    @dish = double(:dish)
    allow(@menu).to receive(:read).and_return({ @dish => 10 })
    @order = Order.new(@menu)
  end

  it 'takes order' do
    @order.add_order(@dish, 1)
    expect(@order.basket[-1]).to eq (@dish)
  end

  it 'records the subtotal of each order' do
    @order.add_order(@dish,1)
    expect(@order.subtotal[-1]).to eq 10
  end

  it 'lists the order summary' do
    @order.add_order(@dish,2)
    expect(@order.list[-1]).to eq "#{@dish} x2 = £20"
  end

  it 'checkouts orders' do
    @order.add_order(@dish,1)
    @order.add_order(@dish,1)
    expect(@order.checkout).to eq 20
  end


  context "Edge cases" do
    it "has no order" do
      expect{@order.checkout}.to raise_error "No order yet."
    end

    it "throws error when the bill is wrong" do
      @order.add_order(@dish,1)
      allow(@order).to receive(:check?).and_return(false)
      expect{@order.checkout}.to raise_error "Bill is not correct."
    end
  end
end
