require 'order'

describe Order do
  describe 'a group of tests that require an item to be added to the basket' do
    before do
      subject.add(2)
    end
    describe '#add' do
      it 'should update the cost' do
        expect(subject.cost).to eq 7
      end
      it 'should add the item to the basket' do
        expect(subject.basket).to eq ["American Hot Pizza £7"]
      end
    end
  end
end
