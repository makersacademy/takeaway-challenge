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

  describe '#order summary' do
    it 'shows order summary' do
      subject.order(1)
      expect(subject.order_summary).to eq [{"Plain noodle"=>3}]
    end
  end

  describe '#order_total' do
    it 'calculates total of order' do
      subject.order(1)
      subject.order(2)
      expect(subject.order_total).to eq 6
    end
  end
end
