require './lib/takeaway.rb'

describe Takeaway do
  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:menu) }

  it { is_expected.to respond_to(:add).with(1).arguments }

  describe '#menu' do
    it 'should be hash type' do
      expect(subject.menu).to be_instance_of(Hash)
    end

  end

  describe '#add' do

    context 'item is added to order' do
      let(:food_item) {double :food_item}

      it 'should update the order attribute' do
        subject.add(food_item)
        expect(subject.order).to have_key(food_item)
      end

      it 'should increment the order attribute count' do
        subject.add(food_item)
        subject.add(food_item)
        expect(subject.order[food_item]).to eq(2)
      end

    end

  end

end
