require 'order'

describe Order do
  subject(:order) {described_class.new}

  it 'should open a new order' do
    expect(order).to respond_to(:menu_index)
  end
end
