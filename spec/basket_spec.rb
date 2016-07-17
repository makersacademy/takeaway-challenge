require 'basket'

describe Basket do
    let(:basket) { described_class.new }
    let(:menu) { double(:menu) }

  describe 'add' do
    it 'adds a certain quantity of a certain dish to the basket' do
      basket.add("sashimi", 2)
      expect(basket.basket_summary).to eq("2x sashimi: £10")
    end
  end
  describe 'basket summary' do
    it 'returns the contents of the basket with pricing' do
      basket.add("sashimi", 2)
      basket.add("uni", 2)
      expect(basket.basket_summary).to eq("2x sashimi: £10, 2x uni: £8")
    end
  end

  describe 'total' do
    it 'returns the total cost of the basket' do
      basket.add("sashimi", 2)
      basket.add("uni", 2)
      expect(basket.total).to eq("£18")
    end
  end

end
