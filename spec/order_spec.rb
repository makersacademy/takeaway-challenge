require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(:menu) }

  let(:menu) { double(:menu) }
  # let(:whiskies) { double(:whiskies) }

  let(:whiskies) do
    {
      :Lagavulin_16yo_Islay => 2,
      :Laphroaig_10yo_Islay => 1
    }
  end

  context 'select' do
    before do
      allow(whiskies).to receive(:has_key?).with(:Lagavulin_16yo_Islay).and_return(true)
      allow(whiskies).to receive(:has_key?).with(:Laphroaig_10yo_Islay).and_return(true)

      allow(menu).to receive(:price).with(:Lagavulin_16yo_Islay).and_return(49.50)
      allow(menu).to receive(:price).with(:Laphroaig_10yo_Islay).and_return(30.00)
    end
      
    it 'can choose multiple items from menu' do
      order.add(:Lagavulin_16yo_Islay, 2)
      order.add(:Laphroaig_10yo_Islay, 1)
      expect(order.whiskies).to eq(whiskies)
    end

    it 'only allows available items to be selected' do
      allow(whiskies).to receive(:has_key?).with(:beer).and_return(false)
      expect { order.add(:beer, 5) }.to raise_error "Sorry, we don't sell beer!"  
    end
  end

  context 'cost' do
    it 'calculates the total' do
      order.add(:Lagavulin_16yo_Islay, 2)
      order.add(:Laphroaig_10yo_Islay, 1)
      total = 120.00
      expect(order.total).to eq(total)
    end
  end
end
