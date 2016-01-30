require_relative '../lib/ristorante'

describe Ristorante do
  let(:order) {double :order}
  subject(:ristorante) {described_class.new(order)}
  let(:dish) {double :dish}

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
      expect(order).to receive(:set_current_order).with(dish, 2)
      order.set_current_order(dish,2)
    end
  end

  describe '#place_order' do
    it "sends #set_current_order to order " do
      expect(order).to receive(:set_current_order).with(dish, 1, 2)
      order.set_current_order(dish, 1 , 2)
    end

    it "sends #send_sms to order " do
      expect(order).to receive(:send_sms)
      order.send_sms
    end

    it "sends #assign_order_number to order " do
      expect(order).to receive(:assign_order_number)
      order.assign_order_number
    end
  end

end
