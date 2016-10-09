require 'order'

describe Order do
  let(:dish) { double :dish }

  describe 'initialization' do
    it 'should have an empty items list' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add selected item to the items list' do
      subject.add_item(dish)
      expect(subject.items).to include dish
    end
  end

  describe '#remove_item' do
    it 'should remove selected item from the items list' do
      subject.add_item(dish)
      subject.remove_item(dish)
      expect(subject.items).not_to include dish
    end
  end
end
