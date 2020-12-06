require 'order'

describe Order do

  let(:dish1_double) {double :dish1, name: "Porridge", price: 1}
  let(:dish2_double) {double :dish2, name: "Soup", price: 3}
  let(:orders_hash) { {dish1_double => 1, dish2_double => 2} }
  let(:check_total) {dish1_double.price * orders_hash[dish1_double] + dish2_double.price * orders_hash[dish2_double]}
  let(:text_double) {double :text, send_message: true}
  let(:text_class_double) { double :text_class, new: text_double}
  let(:order) { described_class.new(orders_hash, check_total, text_class_double) }

  describe '#new'  do
    it 'should be instance' do
      expect(order).to be_instance_of described_class
    end
  end


  describe '#see' do
    it 'should return ordered items with quantities' do
      expect(order.see).to eq orders_hash
    end
  end

  describe '#total' do
    it 'should return the total cost of the order' do
      expect(order.total).to eq check_total
    end
  end

  describe '#send_text' do
    context 'total check is correct' do
      it 'should send a text' do
        expect(order.send_text).to eq true
      end
    end

    context 'total check is incorrect' do
      let(:order) { described_class.new(orders_hash, 0, text_class_double) }
      it 'should send a text' do
        expect { order.send_text }.to raise_error "Incorrect Total"
      end
    end
  end

end
