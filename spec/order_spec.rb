require 'order'

context Order do
  
  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
    
    it 'raises error if not passed an Integer' do
      expect { subject.add("Plain rice") }.to raise_error Order::ERROR_NOT_INTEGER
    end
    
  end
  
  describe '#get' do
    it { is_expected.to respond_to(:get) }
    
  end

end
