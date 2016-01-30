require_relative '../lib/ristorante'

describe Ristorante do
  let(:order) {double :order}
  subject(:ristorante) {described_class.new(order)}
  let(:menu_list) {double :menu_list, one: [dish, 4]}
  let(:dish) {double :dish}

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

  describe '#select_dishes' do
    it "sends set_current_order to order" do
      expect(order).to receive(:set_current_order)
      order.set_current_order(dish,2)
    end
  end

  describe '#place_order' do
    it "sends #set_current_order to order " do
      expect(order).to receive(:set_current_order)
      order.set_current_order
    end

    it "sends #send_sms to order " do
      expect(order).to receive(:send_sms)
      order.send_sms
    end
  end

end
