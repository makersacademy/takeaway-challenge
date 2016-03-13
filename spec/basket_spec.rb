require 'basket'

describe Basket do
  let(:dummy_menu_choice) {double :dummy_menu_choice}
  let(:dummy_selection) {double :dummy_selection}
  subject(:basket) {described_class.new}
  let(:menu_choice) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}


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

  describe '#itemised_bill' do
    let(:sample_selection) {[[:Carbonara, 3], [:Calzone, 1], [:Risotto, 3]]}
    let(:sample_selection_bad) {[[:Carbonara, 3], [:Cake, 1], [:Risotto, 3]]}
    subject(:worked_basket) {described_class.new sample_selection, menu_choice}
    subject(:worked_basket_bad) {described_class.new sample_selection_bad, menu_choice}

    before do
      allow(STDOUT).to receive(:puts).with("Unexpected Item In Bagging Area, removing item")
      allow(worked_basket_bad).to receive(:unexpected_item_in_bagging_area?)
      allow(worked_basket).to receive(:unexpected_item_in_bagging_area?)
      allow(worked_basket_bad).to receive(:remove_unexpected_items)
    end

      it 'returns a multidimensional array, each subarray has 4 elements' do
        worked_basket.itemised_bill
        expect(worked_basket.itemised_bill).to be_a Array
      end

      it 'checks if there are "Unexpected Items In Bagging Area" if item not on menu' do
        expect(worked_basket_bad).to receive(:unexpected_item_in_bagging_area?)
        worked_basket_bad.itemised_bill
      end

      it 'returns true if there are "Unexpected Items In Bagging Area" if item not on menu' do
        expect(worked_basket_bad).to receive(:unexpected_item_in_bagging_area?).and_return true
        worked_basket_bad.itemised_bill
      end

      it 'returns false if there are no "Unexpected Items In Bagging Area" if item not on menu' do
        expect(worked_basket).to receive(:unexpected_item_in_bagging_area?).and_return false
        worked_basket.itemised_bill
      end

      it 'deletes items if they are not on the selected menu.' do
        expect(worked_basket_bad).to receive(:remove_unexpected_items)
        worked_basket_bad.itemised_bill
      end

      it 'has the dish name as the first element' do
        expect(worked_basket.itemised_bill[0][0]).to be_a Symbol
      end


    end

end
