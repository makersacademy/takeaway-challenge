require 'order'

context Order do
  # TODO: refactor to use double for dish_number
  
  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
    
    it 'raises error if not passed an Integer' do
      expect { subject.add("Plain rice") }.to raise_error Order::ERROR_NOT_INTEGER
    end
    
    it 'returns number on success' do
      expect(subject.add(1)).to eq 1
    end
    
  end
  
  describe '#get' do
    it { is_expected.to respond_to(:get) }
    
#     it 'returns Array containing order' do
#       numbers = Array.new
#       numbers.push(1)
#       numbers.push(2)
#       subject.add(1)
#       subject.add(2)
#       expect(subject.get).to eq numbers
#     end
    
  end

end
