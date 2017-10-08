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
    let(:incorrect_total_order) { Order.new }
    before { incorrect_total_order.input_items('Margherita 1, 9') }
    it 'should verify the total of the order' do
      expect { incorrect_total_order.verify_total }.to raise_error "Total does not match the sum of the prices!"
    end
  end

  describe 'edge cases' do
    it 'should raise an error when there are no items in the order' do
      expect { subject.input_items() }.to raise_error 'No items in the order!'
    end
  end

  describe '#send_text' do
    it 'should return the string when not given permission to actually send the text' do
      subject.input_items(order)
      expect(subject.order_complete(false)).to eq "Thank you! Your order of 1 x Margherita and 2 x Meat Feast was placed and will be delivered before #{((Time.now.hour + 1) % 24)}:#{Time.now.min}"
    end
  end
end
