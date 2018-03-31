require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:example_summary) {
    "Your order: pizza x3 = $15.0, burger x2 = $5.0, total: $20.0"
  }

  describe '#add' do
    before do
      order.add('pizza', 5.00, 3)
      order.add('pizza', 5.00, 1)
    end
    it "adds dishes to basket with their quantity" do
      expect(order.basket).to eq('pizza' => 4)
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

  describe '#summary' do
    before do
      order.add('pizza', 5.00, 3)
      order.add('burger', 2.50, 2)
    end

    it "displays a summary of the order" do
      expect(order.summary).to eq example_summary
    end

  end
end
