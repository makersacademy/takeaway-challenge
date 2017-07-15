require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu }
  let(:valid_order) { "Pizza" }
  let(:bad_order) { "Waldorf Salad" }
  subject(:restaurant) { described_class.new(menu) }

  describe '#order_dish' do
    it 'should fail if requested dish is not on the menu' do
      allow(menu).to receive(:includes?) { false }
      expect{restaurant.order_dish(bad_order)}.to raise_exception("Sorry, we don't have that dish!")
    end

    it 'should add the requested dish to the order' do

    end
  end

end
