require 'current_order'
require 'Order'

describe CurrentOrder do
  before do
    @order = Order.new
    @order.start
  end
  
  describe '#show' do
    it 'reveals current order' do
      expect(subject.show).to eq []
    end
  end

end
