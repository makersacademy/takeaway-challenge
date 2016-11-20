require 'order'
describe Order do

  subject(:order) { described_class.new }
  context "#basket"
  it 'should initialize with an empty basket hash' do
    expect(order.basket).to be_empty
  end


end
