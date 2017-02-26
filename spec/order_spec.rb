require 'order'

describe Order do
  subject(:order) {described_class.new}

  it 'responds to #add_item with one arg' do
    expect(order).to respond_to(:add_item).with(1).argument
  end

  it 'responds to #display_order_summary' do
    expect(order).to respond_to(:display_order_summary)
  end

end
