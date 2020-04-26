require 'order'

context Order do
  
  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
    
  end
  
  describe '#get' do
    it { is_expected.to respond_to(:get) }
    
  end

end
