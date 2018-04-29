require 'order'

describe Order do
  let(:order) { 'Gagh, 2, 11.98' }
  let(:order_wrong) { 'Gagh, 2, 5.99' }
  let(:menu) { { 'Gagh' => 5.99,'Spice Melange' => 10.99 } }
  let(:subject) { described_class.new(order, menu) }
  let(:subject_wrong_order) { described_class.new(order_wrong, menu) }

  describe '#correct?' do
    it 'should convert the order string to array' do
      subject.correct?
      expect(subject.instance_variable_get(:@order)).to be_an_instance_of(Hash)
    end
    it 'should extract the total provided by the customer from the array' do
      subject.correct?
      expect(subject.instance_variable_get(:@order_total)).to eq 11.98
    end
    it 'should return true if total supplied by customer is correct' do
      expect(subject.correct?).to be true
    end
    it 'should return false if total supplied by customer is wrong' do
      expect(subject_wrong_order.correct?).to be false
    end
  end

end