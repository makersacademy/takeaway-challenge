require './lib/order.rb'
describe Order do
  describe '#add_items' do
    it 'allows to enter the dish name, quantity and total amount' do
      expect{ subject.add_items("Pad_thai", 2, 16) }.to change { subject.my_order }.to ["Pad_thai * 2"]
    end

    it 'presents the amount to be paid for each dish' do
      expect{ subject.add_items("Pad_thai", 3, 24) }.to change { subject.my_bill }.to [24]
    end
  end
  describe '#total_amount' do
    it 'shows the total amount for all dishes in the order' do
      order = Order.new
      order.add_items("Pad_thai", 2, 16)
      order.add_items("Red_curry", 1, 9)
      expect(order.total_amount).to eq 25
    end
  end
  describe '#place_order' do
    it 'raises an error if the amount for payment does not match the total_amount' do
      order = Order.new
      order.add_items("Pad_thai", 2, 15)
      expect { order.place_order }.to raise_error "Your payment amount is incorrect"
    end
  end
end
