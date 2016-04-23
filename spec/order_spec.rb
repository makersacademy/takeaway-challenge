require 'order'

describe Order do
  
subject(:order) { described_class.new }
let(:an_order) { double :an_order }
  
  it 'has somewhere to store orders' do
    expect(order.check_order).to be_an Array
  end
  
  describe '#check_order' do
    it 'displays the current order' do
      order.take_order(an_order)
      expect(order.check_order.last).to include an_order
    end
  end
  
  
end