require 'order'

describe Order do

  let(:menu) { double :menu }

  subject(:order) { described_class.new(menu) }

  describe '#initialize' do

    it 'is initialized with an empty entries array' do
      expect(order.entries).to be_empty
    end

    it 'is initialized with a menu' do
      expect(order.menu).not_to be_nil
    end
  end

  describe '#add_entry' do
    it 'selects a dish and saves it to the entries' do
      allow(menu).to receive(:get).and_return({ name: "Spaghetti", price: 10 })
      expect(order.add_entry("Spaghetti")).to eq [{ name: "Spaghetti", price: 10 }]
    end
  end
end
