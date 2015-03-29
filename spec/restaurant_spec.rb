require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu, list: {} }
  let(:menu_class) { double :menu_class, new: menu }
  let(:rest) { described_class.new menu_class }
  let(:time) { (Time.now).strftime('%I:%M %p') }
  let(:delivery) { (Time.now + (60 * 60)).strftime('%I:%M %p') }
  let(:order) { double :order, new_order: { carbonara: 4.80 } }

  context 'when created' do
    it 'has a menu' do
      expect(rest.menu.list).to be_empty
    end

    it 'can store orders' do
      expect(rest.order_recived).to eq []
    end
  end

  context 'when recives an order' do
    before do
      expect(rest).to receive(:send_message)
    end
    it 'sends a message and stores the recived order' do
      rest.get order, :total, :tel
      expect(rest.order_recived).to eq [[order.new_order, time, delivery, :tel]]
    end
    it 'gets the now time' do
      rest.get order, :total, :tel
      expect(rest.order_recived.last[1]).to eq time
    end
    it 'gets the time plus one hour' do
      rest.get order, :total, :telephone
      expect(rest.order_recived.last[2]).to eq delivery
    end
  end
end
