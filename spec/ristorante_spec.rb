require_relative '../lib/ristorante'

describe Ristorante do
  subject(:ristorante) {described_class.new}
  let(:menu_list) {double :menu_list}
  let(:food) {double :food}
  let(:quantity) {double :quantity}


  describe '#menu'
    context 'menu options' do
      it "doesn't raise error when menu is called" do
        expect {ristorante.menu}.not_to raise_error
      end

      it "returns the dish list" do
        allow(ristorante).to receive(:menu) {menu_list}
        expect(ristorante.menu).to eq menu_list
      end
    end

  # describe '#place_order' do
  #   context 'order options' do
  #     it "selects several dishes" do
  #       ristorante.place_order(food, quantity)
  #       ristorante.place_order(food, quantity)
  #       current_order = {egg_fried_rice: 6, miso_soup: 6}
  #       expect(ristorante.current_order).to include(current_order)
  #     end
  #   end
  # end

end
