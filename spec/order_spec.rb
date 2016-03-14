require 'order'

describe Order do
  subject(:order) { described_class.new(menu: menu, text: text)}
  let(:item) { double :item }
  let(:item2) { 'Pizza' }
  let(:price) { 6 }
  let(:menu) {double :menu, show: {item=>price}}
  let(:menu_hash) { {item=>price, item2=>price} }
  let(:list) { {item=>price} }
  let(:text) { double :text }
  let(:time) { (Time.now + 3600).strftime("%H:%M") }

  describe '#read_menu' do
    it 'shows the menu & prices' do
      expect(order.read_menu).to eq list
    end
  end

  describe '#add' do
    it 'raise error if dish not on menu' do
      message = "That's not on this menu."
      expect{order.add(item2)}.to raise_error message
    end
  end

  context 'item is on menu' do
    before do
    allow(menu).to receive(:show).and_return(menu_hash)
    end

    describe '#add' do
      it 'adds dish to order' do
        order.add(item)
        expect(order.order[0]).to include item
      end

      it 'adds item to order sum' do
        order.add(item, 2)
        expect(order.order_sum.size).to eq 2
      end
    end

    describe '#order_summary' do
      it 'returns the whole order, including quantity and price' do
        order.add(item2)
        summary = "1x #{item2}(s), £#{price} each. Total: £#{price}.\n"
        expect(order.summary).to eq summary
      end
    end

    describe '#calculate_total' do
      it 'returns total price for order' do
        order.add(item)
        total = "Your total for this order is £#{price}."
        expect(order.calculate_total).to eq total
      end
    end

    describe '#pay' do
      it 'if payment correct, sends confirmation text' do
        message = "Thank you! Your order should be with you by #{time}"
        expect(text).to receive(:send_confirmation).with(message)
        order.pay(price)
      end
    end
  end
end
