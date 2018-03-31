require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#add' do
    before do
      order.add('pizza', 5.00, 3)
      order.add('pizza', 5.00, 1)
    end
    it "adds dishes to basket with their quantity" do
      expect(order.basket).to eq('pizza' => 4)
    end

    it "adds the prices to the prices array" do
      expect(order.prices).to eq([5.0, 5.0, 5.0, 5.0])
    end
  end

  describe '#total' do
    before do
      order.add('pizza', 5.00, 3)
    end

    it "outputs the total of all the prices" do
      expect(order.total).to eq 15.0
    end
  end
end
