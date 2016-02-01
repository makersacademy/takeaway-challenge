require_relative '../lib/ristorante'

describe Ristorante do
  subject(:ristorante) {described_class.new(order)}

  let(:order) {double :order}
  let(:dish) {double :dish}
  let(:dish1) { {dish: "pizza", quantity: 2, price: 2} }

  before do
    allow(order).to receive(:wrong_total?) {false}
    allow(order).to receive(:send_sms)
    allow(order).to receive(:assign_order_number)
  end

  describe '#menu'
    context 'menu options' do
      it "doesn't raise error when menu is called" do
        expect {ristorante.menu}.not_to raise_error
      end

      it "expects the menu to be a has" do
        expect(ristorante.menu).to be_a Hash
      end
    end

  describe '#select_dishes' do
    it "sends set_current_order to order" do
      expect(order).to receive(:set_current_order)
      ristorante.select_dishes(1,2)
    end
  end

  describe '#place_order' do
    it "sends #send_sms to order " do
      expect(order).to receive(:send_sms)
      ristorante.place_order
    end

    it "sends #assign_order_number to order " do
      expect(order).to receive(:assign_order_number)
      ristorante.place_order
    end
  end

end
