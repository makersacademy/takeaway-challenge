require 'take_away'

describe Takeaway do
  describe '#order' do
    it 'order equals empty array' do
      expect(subject.order).to eq []
    end

    it 'orders plain noodles' do
      expect(subject.order(1)).to eq [1]
    end
  end

end
