require 'order'
require 'menu'

describe Order do

  before (:each) do
  @menu = double(:menu)
  @dish = double(:dish)
  allow(@menu).to receive(:read).and_return({ @dish => 10 })
  @order = Order.new(@menu)
  end

  it {is_expected.to respond_to :menu }
  it {is_expected.to respond_to :basket}
  it {is_expected.to respond_to(:add_order).with(2).argument}

  it 'takes order' do
    @order.add_order(@dish, 1)
    expect(@order.basket[-1]).to eq (@dish)
  end
end
