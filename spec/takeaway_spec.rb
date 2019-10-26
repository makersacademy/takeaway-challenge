require 'takeaway'

describe Takeaway do

  items = { 'Spring rolls' => 2.99,
  'Prawn toast' => 4.00,
  'Special Chow Mein' => 6.50,
  'Egg Fried Rice' => 2.99 }


  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, dishes: items, show_menu: items) }

  let(:subject) { described_class.new(menu_class) }

  let(:order) { double(:order, current_order: [], add_price: 2.99, add_item: [{ 'Spring rolls' => 2.99 }], display_order: { 'Spring rolls' => 2.99 } ) }
  let(:order_class) { double(:order_class, new: order) }

  describe '#view_menu' do
    it 'shows a list of items with prices' do
      expect(subject.view_menu).to eq menu.show_menu
    end
  end

  describe '#new_order' do
    it 'creates a new order' do
      expect(subject.new_order(order_class)) .to eq order
    end
  end

  describe '#add_item' do
    it 'adds selected item to oder' do
      subject.new_order(order_class)
      subject.add_item('Spring rolls')
      expect(subject.order.add_item('Spring rolls')).to include({ 'Spring rolls' => 2.99 })
    end
  end

  describe '#view_receipt' do
    it 'shows the current order' do
      subject.new_order(order_class)
      subject.add_item('Spring rolls')
      expect(subject.view_order).to eq subject.order.display_order
    end
  end

end
