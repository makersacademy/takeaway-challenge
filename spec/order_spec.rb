require_relative '../lib/order'

describe Order do
  subject(:order) { described_class.new(sms) }

  let(:sms) {double :sms}
  let(:dish) { double :dish }
  let(:c_order) { [{dish: dish, quantity: 1, price: 2}] }

  describe '#set_current_order' do
    it "populates current order array" do
      order.set_current_order(dish, 1, 2)
      expect(order.current_order).to match(c_order)
    end

    it "adds a total amount" do
      order.set_current_order(dish, 1, 2)
      expect(order.order_total).to eq 2
    end
  end

  describe '#sum_up_prices' do
    it "returns the sum of the current order's prices" do
      order.set_current_order(dish, 1, 2)
      order.set_current_order(dish, 1, 4)
      expect(order.sum_up_prices).to eq 6
    end
  end

  describe '#assign_order_number' do
    it "gives a random number from 1-5000 to every order" do
      expect(order.assign_order_number).to be_between(1, 5000).inclusive
    end
  end

  describe "#wrong_total?" do
    it "returns false if sum_up_prices is not equal to total " do
      order.set_current_order(dish, 1, 2)
      expect(order.wrong_total?).to eq false
    end
  end

  describe "#send_sms" do
    it "sends #send message to sms object" do
      expect(sms).to receive(:send)
      sms.send
    end

    it "it clears the #current_order array" do
      order.set_current_order(dish, 1, 2)
      allow(sms).to receive(:send) {nil}
      order.send_sms
      expect(order.current_order).to be_empty
    end

    it "it resets the #order_total" do
      order.set_current_order(dish, 1, 2)
      allow(sms).to receive(:send) {nil}
      order.send_sms
      expect(order.order_total).to eq 0
    end
  end

end
