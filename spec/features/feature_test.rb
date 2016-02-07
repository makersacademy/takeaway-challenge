require_relative '../../lib/ristorante'
require_relative '../../lib/order'

describe Ristorante do
  let(:order) { Order.new}
  subject(:ristorante) {described_class.new(order)}
  let(:menu) {ristorante.menu}
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
        expect(ristorante.menu).to eq menu
      end
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe '#select_dishes' do
    context 'order options' do
      it "selects several dishes" do
        ristorante.select_dishes(1, 2)
        order = [{dish: :egg_fried_rice, quantity: 2, price: 6}]
        expect(ristorante.order.current_order).to match(order)
      end
    end
  end

  describe '#order_total' do
    it "returns the current order total" do
      ristorante.select_dishes(1, 2)
      order = [{dish: :egg_fried_rice, quantity: 2, price: 6}]
      expect(ristorante.order.order_total).to eq(6)
    end

  end

  describe "#place_order" do
    it "raises an error if the order total differs the selected dishes" do
      ristorante.select_dishes(1, 2)
      allow(order).to receive(:wrong_total?) {true}
      expect {ristorante.place_order}.to raise_error("Wrong total amount")
    end

    it "resets order.order_total after you place an order" do
      ristorante.select_dishes(1, 2)
      ristorante.place_order
      expect(order.order_total).to eq 0
    end

  end


end
