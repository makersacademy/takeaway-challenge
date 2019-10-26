require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { Menu.new }
  let(:textprovider) { double :textprovider }

  context 'by default' do
    it 'has an empty array' do
      expect(order.basket).to be_empty
    end
  end

  describe '#select_dish' do
    it 'takes a dish number and quantity as arguments' do
      expect(order).to respond_to(:select_dish).with(2).arguments
    end

    it 'stores dish and total in basket' do
      order.select_dish(1, 2)
      expect(order.basket).to include({ :dish => "Egg fried rice", :total => 6 })
    end
  end

  describe '#basket_summary' do
    it 'displays basket' do
      order.select_dish(1, 2)
      expect { order.basket_summary }.to output("Egg fried rice, £6\n").to_stdout
    end
  end

  describe '#order_total' do
    it 'sums totals in basket' do
      order.select_dish(1, 2)
      order.select_dish(1, 2)
      expect(order.order_total).to eq 12
    end
  end

  describe '#place_order' do
    before do
      allow(order).to receive(:send_text)
      order.select_dish(1, 2)
    end

    it 'raises error if passed incorrect amount' do
      expect { order.place_order(11, textprovider) }.to raise_error "Amount not correct"
    end

    it 'can send a text confirming order placed' do
      expect(textprovider).to receive(:send_text)
      order.place_order(6, textprovider)
    end
  end
end
