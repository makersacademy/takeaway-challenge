require_relative '../../lib/ristorante'

describe Ristorante do
  subject(:ristorante) {described_class.new}
  let(:menu_list) {Ristorante::MENU_LIST}
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "returns the menu list" do
    expect {ristorante.menu}.not_to raise_error
  end

  describe '#menu' do
    context 'menu options' do
      it "doesn't raise error when menu is called" do
        expect {ristorante.menu}.not_to raise_error
      end

      it "returns the dish list" do
        expect(ristorante.menu).to eq menu_list
      end
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe '#place_order' do
    context 'order options' do
      it "selects several dishes" do
        ristorante.place_order(1, 2)
        ristorante.place_order(3, 2)
        expect(ristorante.current_order).to include(:miso_soup, 6)
      end
    end
  end

end
