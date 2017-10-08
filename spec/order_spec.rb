require 'order'
describe Order do
  let(:order) { 'Margherita 1, Meat Feast 2, 20.5' }
  let(:order_with_items) { Order.new }
  before { order_with_items.input_items(order) }
  describe '#input_items' do
    it 'should respond to the input_items method' do
      expect(subject).to respond_to :input_items
    end

    context 'items' do
      it 'should translate the string into items in the items array' do
        expect(order_with_items.items).to eq [{ name: 'Margherita', quantity: 1 }, { name: 'Meat Feast', quantity: 2 }]
      end
    end
  end

  describe '#verify_total' do
    it 'should verify the total of the order' do
      expect(order_with_items.verify_total).to eq true
    end
  end
end
