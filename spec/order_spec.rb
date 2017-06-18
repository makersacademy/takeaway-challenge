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
    it 'selects some number of several available dishes' do
      allow(menu).to receive(:get).and_return({ name: "Spaghetti", price: 10 })
      expect(order.add_entry("Spaghetti", 2)).to eq [{ name: "Spaghetti", price: 10 }, { name: "Spaghetti", price: 10 }]
    end

    it 'raises an error if no dish has been found' do
      allow(menu).to receive(:get).and_return(nil)
      expect { order.add_entry("Lasagna") }.to raise_error("Dish not found")
    end
  end
end
