require 'order'

describe Order do
    it {is_expected.to respond_to(:add_item)}

    describe '#add_item' do
      it 'add item to order' do
        expect(subject.add_item(item)).to include item
      end
    end
end
