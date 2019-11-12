require './lib/order.rb'

describe Order do
  it { is_expected.to be_instance_of(described_class) }

  describe '#items' do
    it 'should respond be of type hash' do
      expect(subject.items).to be_instance_of(Hash)
    end
  end

  describe '#add' do
    let(:food_item) {double :food_item}
    let(:quantity) {double :quantity}

    context 'item is added to order' do
      it 'should update the order attribute items' do
        subject.add(food_item, quantity)
        expect(subject.items).to have_key(food_item)
      end
    end
  end

  describe '#summary' do
    it 'should return the order summary' do
      subject.add("Pizza", 3)
      expected_message = "Pizza x3 = £15"
      expect(subject.summary).to eq(expected_message)
    end
  end

  describe '#total' do
    it 'should return the total order cost' do
      subject.add("Pizza", 3)
      expected_message = "Total: £15"
      expect(subject.total).to eq(expected_message)
    end
  end
end
