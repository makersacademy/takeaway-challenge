require 'order'

describe Order do
  let(:subject) { described_class.new }

  items = { 'Spring rolls' => 2.99,
  'Prawn toast' => 4.00,
  'Special Chow Mein' => 6.50,
  'Egg Fried Rice' => 2.99 }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, dishes: items, show_menu: items) }

  describe '#initialize' do
    it 'should contain an empty array' do
      expect(subject.current_order).to eq []
    end
  end

  describe '#add_item' do
    it 'should add an item to current order' do
      expect(subject.add_item({ 'Spring rolls' => 2.99 })).to include({ 'Spring rolls' => 2.99 })
    end
  end

  describe '#order_total' do
    it 'should add up the total cost for the current order' do
      subject.add_item('Spring rolls' => 2.99)
      subject.add_item('Special Chow Mein' => 6.50)
      subject.add_item('Egg Fried Rice' => 2.99)

      expect(subject.order_total).to eq 12.48
    end
  end
end
