require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(:menu) }

  let(:menu) { double(:menu) }
  let(:whiskies) { double(:whiskies) }

  let(:whiskies) do
    {
      "thing1": 2,
      "thing2": 1
    }
  end

  context 'select' do
    before do
      allow(whiskies).to receive(:has_key?).with("thing1").and_return(true)
      allow(whiskies).to receive(:has_key?).with("thing2").and_return(true)
    end
      
    it 'can choose multiple items from menu' do
      order.add(:thing1, 2)
      order.add(:thing2, 1)
      expect(order.whiskies).to eq(whiskies)
    end

    it 'only allows available items to be selected' do
      allow(menu).to receive(:has_key?).with("durian").and_return(false)
      expect{ order.add("durian", 5) }.to raise_error "Sorry, we don't offer durian!"  
    end
  end
end
