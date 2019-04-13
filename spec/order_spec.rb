require 'Order'

describe Order do
  order = described_class.new
  
  describe '#select' do
    it 'logs quantities' do
      expect(order.select('quantity')).to eq('quantity')
    end
  end
end
