require_relative '../lib/order'


describe Order do
  subject(:order) { described_class.new }
  let(:basket) { { pasta: 6,  gelato: 4 } }
  
  # it { is_expected.to respond_to(:add_to_order).with(1).argument }
  
  describe "#add_to_order" do
    it 'adds a dish to the order' do
      order.add_to_order(:pasta, 6)
      order.add_to_order(:gelato, 4) 
      expect(order.basket).to eq(basket)
    end
  end

  describe '#order_total' do
    it 'calculates total price' do
      order.add_to_order(:pasta, 2)
      order.add_to_order(:gelato, 2)
      total = 20
      expect(order.order_total).to eq(total)
    end
  end
end