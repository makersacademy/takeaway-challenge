require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'initializes with an empty array' do
    expect(order.current).to be_empty
  end

end
