require 'order_log'

describe OrderLog do

  # it {is_expected.to respond_to(:add).with(1).arguments}

  let(:menu) {double :menu, get: menu_item}
  let(:menu_item) {double :menu_item, name: "dish", price: 1}
  subject(:order_log) {OrderLog.new(menu)}

  describe "#initalize" do

  end

  describe '#list' do
    it 'starts empty' do
      expect(order_log.list).to be_empty
    end

    context "after a dish has been logged" do
      it 'shows dish' do
        order_log.add "dish"
        expect(order_log.list).not_to be_empty
      end

      it 'format - "dish: price" on its own line' do
        msg = "#{menu_item.name}: #{menu_item.price}"
        order_log.add "dish"
        order_log.add "dish"
        expect(order_log.list).to eq "#{msg}\n#{msg}\n"
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

    # it 'adds a dish' do
    #   order_log.add "name"
    # end

  end


end
