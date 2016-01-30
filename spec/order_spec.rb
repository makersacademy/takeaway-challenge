require 'order'

describe Order do
  subject(:order) { described_class.new('menu')}

  it 'creates current order array' do
    expect(order.current_order).to eq []
  end

  it 'selects item' do
    order.select_item('chips')
    expect(order.current_order).to include 'chips'
  end
end
