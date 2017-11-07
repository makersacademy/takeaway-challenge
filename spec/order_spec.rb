require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish, name: 'korma', options: {chicken: 5.95, prawn: 6.95}) }

  describe '#add' do
    context 'when choosing a dish' do
      it 'adds the dish to the order' do
        expect{ order.add(dish) }.to change { order.items.length }.by(1)
      end
    end
  end

  describe '#view_order' do
    it 'outputs the full order in a readable format' do
      order.items << {chicken_korma: 5.95}
      order.items << {prawn_korma: 6.95}
      string = "Order:\n" +
      "Chicken korma: £5.95\n" +
      "Prawn korma: £6.95\n"
      expect { order.view }.to output(string).to_stdout
    end
  end

  describe '#total' do
    it 'returns order total' do
      order.items << {chicken_korma: 5.95}
      expect(order.total).to eq(5.95)
      order.items << {prawn_korma: 6.95}
      expect(order.total).to eq(12.9)
    end
  end
end
