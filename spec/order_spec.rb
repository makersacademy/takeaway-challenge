require 'order'

describe Order do
  subject(:order) { described_class.new}

  it 'is initialized with an empty order' do
    expect(order.current).to eq({})
  end

end
