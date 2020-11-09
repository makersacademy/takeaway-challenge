require 'order'

describe Order do

  let(:fish) { double('dish', name: "fish", price: 9.99) }
  subject(:order) { Order.new }

  describe "#add" do
    it 'accepts two arguments; dish name and quantity' do
      expect(order).to respond_to(:add).with(2).arguments
    end
    it 'adds dish name and quantity to order list' do
      order.add(fish, 2)
      expect(order.order_list.count(fish)).to eq 2
    end
  end

  describe '#total' do
    it 'shows the final total price of the order' do
      order.add(fish, 2)
      expect(order.total).to eq fish.price * 2
    end
  end

  describe '#Place_order' do
    before do
      allow(order).to receive(:send_confirmation_text)
    end
    it 'sends delievry confirmation text' do
      expect(order).to receive(:send_confirmation_text)
      order.place_order
    end
  end

end
