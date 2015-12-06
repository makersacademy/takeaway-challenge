require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu, has?: true }
  let(:menu_klass) { double :menu_klass, new: menu}
  let(:takeaway) { described_class.new(menu_klass) }

  describe '#menu' do
    it 'has to show dishes available in menu' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#show_basket' do
    it 'says the basket is empty at the beginning' do
      msg = 'Basket is empty'
      expect(takeaway.show_basket).to eq msg
    end

  end

  describe '#add_to_basket' do
    it 'adds 1 dish to the basket if no quantity argument is given' do
      takeaway.add_to_basket('dish')
      expect(takeaway.basket).to include 'dish' => 1
    end

    it 'adds a specific quantity of dish to the basket' do
      takeaway.add_to_basket('dish', 5)
      expect(takeaway.basket).to include 'dish' => 5
    end

    it 'raise an error if the dish is not in the menu' do
      allow(menu).to receive(:has?).and_return false
      msg = 'Dish not available'
      expect { takeaway.add_to_basket('dish_not_available') }.to raise_error msg
    end
  end

  context 'when basket is no more empty' do
    before do
      takeaway.add_to_basket('dish')
    end
    describe '#add_to_basket' do
      it 'adds the dish with no overwriting previous amount' do
        takeaway.add_to_basket('dish')
        expect(takeaway.basket).to include 'dish' => 2
      end
    end
  end
end
