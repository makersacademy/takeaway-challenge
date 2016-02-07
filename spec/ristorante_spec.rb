require_relative '../lib/ristorante'

describe Ristorante do
  subject(:ristorante) {described_class.new(order)}

  let(:order) {double :order}
  let(:dish) {double :dish}
  let(:error) {"Wrong total amount"}

  before do
    allow(order).to receive(:wrong_total?) {false}
    allow(order).to receive(:send_sms)
    allow(order).to receive(:assign_order_number)
  end

  describe '#menu'
    context 'menu options' do
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
    it "raises and error if the order is wrong" do
      allow(order).to receive(:wrong_total?) {true}
      expect {ristorante.place_order}.to raise_error(error)
    end

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
