require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'should initialize with an empty order list' do
    expect(order.list).to be_empty
  end

end
