require 'order'

describe Order do
  subject(:order) { described_class.new }
  it 'should take an input to make a menu selection' do
    expect(order.selection).not_to eq nil
  end
end
