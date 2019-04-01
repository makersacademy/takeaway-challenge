require 'order'

describe Order do
  describe '#add_to_order' do
    it 'should add item to order' do
      item = "korma"
      qty = 1
      subject.add_to_order(item, qty)
      expect(subject.order).to include(item => qty)
    end
  end

  describe '#total' do
    it 'should add up the total' do
      item = "korma"
      qty = 1
      subject.add_to_order(item, qty)
      expect(subject.total).to eq 7
    end
  end

  describe '#expected_total' do
    it 'should raise an error if total != expected_total' do
      item = "korma"
      qty = 2
      amount = 10
      subject.add_to_order(item, qty)
      expect { subject.expected_total(amount) }.to raise_error 'Incorrect amount!'
    end
  end
end
