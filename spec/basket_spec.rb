require 'basket'

describe Basket do
    let(:basket) { Basket.new }

    describe 'initialize' do
      it 'creates an empty basket summary' do
        expect(basket.basket_summary).to be_a(Hash)
      end

    end
  describe 'add' do
    it 'adds a certain quantity of a certain dish to the basket' do
      basket.add("sashimi", 2)
      expect(basket.basket_summary).to have_key("2x sashimi")
    end
  end

end
