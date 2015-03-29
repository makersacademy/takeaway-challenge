require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu, list: {} }
  let(:menu_class) { double :menu_class, new: menu }
  let(:restaurant) { described_class.new menu_class }
  let(:order) { double :order }

  context 'when created' do
    it 'has a menu' do
      expect(restaurant.menu.list).to be_empty
    end

    it 'can store orders' do
      expect(restaurant.order_recived).to eq []
    end
  end

  context 'when recives an order' do
    before do
      expect(restaurant).to receive(:send_message)
    end
    it 'sends a message and stores the recived order' do
      restaurant.get order, :total, :telephone
      expect(restaurant.order_recived).to eq [order]
    end
  end
end
