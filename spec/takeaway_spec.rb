require './lib/takeaway.rb'

describe Takeaway do
  it { is_expected.to be_instance_of(described_class) }

  describe '#add' do
    context 'item is added to order' do
      let(:food_item) {double :food_item}
      let(:quantity) {double :quantity}

      it 'should update the order attribute' do
        subject.add(food_item)
        expect(subject.order).to have_key(food_item)
      end

      it 'should increment the order attribute count' do
        subject.add(food_item)
        subject.add(food_item)
        expect(subject.order[food_item]).to eq(2)
      end

      it 'should allow item and quantity to be specified' do
        subject.add(food_item,quantity)
        expect(subject.order[food_item]).to eq(quantity)
      end
    end
  end
end
