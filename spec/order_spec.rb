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
end
