require 'order.rb'
describe Order do
  subject {Order.new(:restaurant)}
  
  describe '#order' do
    it 'should respond to order' do
      is_expected.to respond_to(:order)
    end
  end
end
