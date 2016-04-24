require 'order_log'

describe OrderLog do

  it {is_expected.to respond_to(:remove).with(1).argument}

  let(:menu) {double :menu, get: menu_item}
  let(:menu_item) {double :menu_item, name: "dish", price: 1}
  subject(:order_log) {OrderLog.new(menu)}

  describe '#show' do
    it 'starts empty' do
      expect(order_log.show).to be_empty
    end

    context "after a dish has been logged" do
      it 'shows dish' do
        order_log.add "dish"
        expect(order_log.show).not_to be_empty
      end

      it 'format - "dish: price" on its own line' do
        msg = "#{menu_item.name}: #{menu_item.price}"
        order_log.add "dish"
        order_log.add "dish"
        expect(order_log.show).to eq "#{msg}\n#{msg}\n"
      end
    end
  end

  describe '#add' do
    it 'gets item from the menu' do
      expect(menu).to receive(:get).with("item")
      order_log.add "item"
    end

    it 'can add multiple items' do
      quantity = 7
      expect(menu).to receive(:get).with("item").exactly(quantity).times
      order_log.add "item", quantity
    end

    it 'default add only 1 item' do
      quantity = 1
      expect(menu).to receive(:get).with("item").exactly(quantity).times
      order_log.add "item"
    end
  end

  describe '#remove' do
    before {order_log.add "item"}
    it 'takes item off current order' do
      order_log.remove "item"
      expect(order_log.show).to eq ""
    end

    it 'takes multiple items off current order' do
      order_log.add
    end
  end

  describe '#total' do
    it 'total for new order is 0' do
      expect(order_log.total).to eq 0
    end

    it 'returns current order price' do
      quantity = 5
      quantity.times {order_log.add "dish"}
      expect(order_log.total).to eq menu_item.price * quantity
    end
  end
end
