require 'order'

describe Order do

  subject(:order) { described_class.new }

  context '#order' do

    it { is_expected.to respond_to(:view) }
    it { is_expected.to respond_to(:select) }
    it { is_expected.to respond_to(:calculate) }
    it { is_expected.to respond_to(:text) }

    it 'shows customer the menu' do
      expect(order.view).to be_a Hash
    end

    it 'allows customer to select quantities of available dishes' do
      expect(order).to respond_to(:select).with(2).arguments
    end

    it 'updates basket' do
      order.select("Pollo", 2)
      expect(order.basket).to include("Pollo")
    end

    it 'calculates total order' do
      expect(order.calculate("Pollo", 2)).to eq 15.98
    end

    it 'sends text message confirming order' do
      expect(order.text).to eq send_message
    end
  end
end
