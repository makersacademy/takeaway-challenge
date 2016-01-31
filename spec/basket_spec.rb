require 'basket'

describe Basket do
  let(:dummy_menu_choice) {double :dummy_menu_choice}
  let(:dummy_selection) {double :dummy_selection}
  subject(:basket) {described_class.new}

  describe "#initialize" do

    it 'initializes with a selection array' do
      expect(basket.selection).to be_a Array
    end

    it 'has an empty selection array by default' do
      expect(basket.selection).to be_empty
    end

    it 'has a default menu_choice as take_away_ui, returning a hash' do
      expect(basket.menu_choice).to be_a Hash
    end

    context 'it can initialize with different selections and menu_choices' do
      subject(:special_basket) {described_class.new dummy_selection, dummy_menu_choice}

      it 'initializes with different selection received from Order or TakeAway' do
        expect(special_basket.selection).to eq dummy_selection
      end

      it 'initializes with different menu_choice received from Order or TakeAway' do
        expect(special_basket.menu_choice).to eq dummy_menu_choice
      end

    end
  end

  describe '#bill' do

      xit 'creates a three dimensional array of meals, prices and quantity' do

      end

end
