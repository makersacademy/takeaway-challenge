require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:basket) {{"squid" => 5, "pork" => 6}}
  # let(:pork) {double :dish, price: 8}

  describe '#initialize' do
    it 'empty basket array to begin with' do
      expect(subject.basket).to eq({})
    end
  end

  describe '#add_dish' do
    it 'adds a dish to the basket' do
      subject.add_dish("squid", 4)
      expect(subject.view_basket).to include("squid")
    end
  end

  describe '#total_order' do
    it 'checks the total value of the order' do
      order.add_dish("squid", 2)
      expect(order.total_order).to eq "Order total: £10"
    end
  end
end