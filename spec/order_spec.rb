require 'order'

describe Order do
  let(:description) {"Cheeseburger"}
  let(:price) {4.99}
  let(:burger) { double :dish, :description => description,
                              :price => price }
  let(:order_total) { double :order_total, calculate: price }
  let(:order_total_klass) { double :order_total_klass, new: order_total }
  subject(:order) {described_class.new(order_total_klass: order_total_klass)}

  context 'Order Lines' do
    it {is_expected.to respond_to(:order_lines)}
  end

  context 'Initialization' do
    it 'starts with an empty order' do
      expect(order.order_lines).to be_empty
    end
  end

  context 'Add an item to the order' do
    it {is_expected.to respond_to(:add).with(2).arguments}

    it 'Adds an item to the order' do
      order.add(burger, 1)
      expect(order.order_lines).not_to be_empty
    end
  end
  context 'Calculating total' do
    it {is_expected.to respond_to(:total)}

    it 'calculates the total of the order' do
      order.add(burger,1)
      expect(order.total).to eq price
    end

  end
end
