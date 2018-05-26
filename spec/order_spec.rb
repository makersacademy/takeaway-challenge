require './lib/order.rb'

describe Order do

  subject(:order) { described_class.new }

  context 'default #initialization' do
    it 'can create a new order' do
      expect { Order.new }.not_to raise_error
    end
  end

  context '#order' do
    it 'responds to an order request' do
      expect { order.request }.not_to raise_error
    end
  end 
end
