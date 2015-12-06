require 'order'
describe Order do
  subject(:order){described_class.new}

  it 'initialize with no items listed'do
    expect(order.list).to be_empty
  end
end
