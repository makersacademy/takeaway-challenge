require 'take_away'

describe Takeaway do
  describe '#order' do
    it 'order equals empty array' do
      expect(subject.order).to eq "Basket: []"
    end

    it 'orders plain noodles' do
      expect(subject.order(1)).to eq "Basket: [1]"
    end
  end

  describe '#order summary' do
    it 'shows order summary' do
      subject.order(1)
      hash = {"Plain noodle"=>1}
      expect(subject.order_summary).to eq hash
    end
  end

  context 'subject has more than one order' do
    before do
      subject.order(1)
      subject.order(2)
      subject.order_summary
    end

  describe '#order_total' do
    it 'calculates total of order' do
      expect(subject.total).to eq "Total to pay: £6"
    end

    it 'raises error if total does not match sub total' do
      subject.sub_total = 100
      expect{ subject.total }.to raise_error "Total incorrect"
    end
  end
end

end
