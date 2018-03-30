require 'order'

describe Order do
  subject(:invalid) { described_class.new(
   { :lamb_bhuna => 2,
     :bhaji => 2,
     :total => 5 } ) }
  subject(:valid) { described_class.new(
   { :lamb_bhuna => 2,
     :bhaji => 2,
     :total => 4 } ) }
  subject(:empty_order) { described_class.new([])}

  describe '.place_order' do 
    context 'when passed an order with incorrect total' do 
      it ' raises an error' do 
        expect{ invalid.place_order }.to raise_error StandardError
      end 
    end
    context 'when passed an empty order' do 
      it 'raises an error' do 
        expect{ empty_order.place_order }.to raise_error StandardError
      end 
    end 
    context 'when passed an order with correct total' do
      it 'returns true' do 
        valid.stub(:send_text) { true }
        expect(valid.place_order).to eq(true)
      end 
    end 
  end 
end 