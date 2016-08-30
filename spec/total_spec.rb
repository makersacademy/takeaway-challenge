describe Total do

# subject(:takeaway) {described_class.new(order)}
# let(:menu) {double :menu}
# let(:order) {double :order, add: ()}
# let(:item) {double :item}
# let(:quantity) {double :quantity}

  describe '#calculate_total' do
    it 'calculates the total' do
      order = Order.new
      order.add("pork", 7)
      order.add("chicken", 6)
      total = Total.new(order)
      expect(total.calculate_total).to eq 39
    end
  end

  describe '#show_total' do
    it 'prints the total' do
      order = Order.new
      order.add("pork", 7)
      order.add("chicken", 6)
      total = Total.new(order)
      expect(total.show_total).to eq "Total amount: 39£"
    end
  end
end

# ,double(add:("chicken", 6))
