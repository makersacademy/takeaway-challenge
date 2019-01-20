require 'order'

describe Order do

  before(:each) {
    @ppp_items = [{ :pizza => 2, :pasta => 1 }, 4]
    @incomplete_order = Order.new(@ppp_items)
    @complete_order = Order.new([{ :pizza => 2, :pasta => 1 }, 3])
  }

  it 'initializes with list of items' do
    expect(@incomplete_order.items).to eq @ppp_items
  end

  it 'checks the order is complete' do
    expect { @incomplete_order.complete? }.to raise_error "quantity mismatch"
  end

  it 'sends text if order complete' do
    expect(@complete_order.complete?).to eq true
  end

end
