require 'current_order'
require_relative 'menu_spec'

describe CurrentOrder do

  let(:menu_item) { double }

  describe '#add_item' do
    it 'adds an item to the current oder' do
      subject.add_item(menu_item)
      expect(subject.order).to eq([menu_item])
    end
  end

  describe '#total' do
    it 'adds the total of the meal' do
      subject.add_item(TEST_ORDER)
      subject.add_item(TEST_ORDER)
      expect(subject.total).to eq(13.5)
    end
  end

  describe '#clear_order' do
    it 'emptys the order array' do
      subject.add_item(TEST_ORDER)
      subject.add_item(TEST_ORDER)
      expect(subject.clear_order).to eq([])
    end
  end

end
