require './lib/order.rb'
describe Order do
  describe '#add_items' do
    it 'allows to enter the dish name and quantity' do
      expect{ subject.add_items("Pad_thai", 2) }.to change { subject.my_order }.to ["Pad_thai * 2"]
    end

    it 'presents the amount to be paid for each dish' do
      expect{ subject.add_items("Pad_thai", 3) }.to change { subject.my_bill }.to [24]
    end

    it 'shows the total amount for all dishes in the order' do
      order = Order.new
      order.add_items("Pad_thai", 2)
      order.add_items("Red_curry", 1)
      expect(order.total_amount).to eq 25
    end
  end
end
