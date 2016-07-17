require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish1) {double :dish, name: "Pad Thai", price: 5}
  let(:dish2) {double :dish, name: "Dumplings", price: 6}

  describe '#show_menu' do
    it 'displays a menu to a customer' do
      expect(takeaway.show_menu).to eq []
    end
  end

  describe '#check_total' do
    context 'in the context that an order has been placed' do
      it 'will return the total cost of the order' do
        order = takeaway.customer_order
        order.place_order(dish1, dish2)
        expect(takeaway.check_total).to eq "Your order will cost £11"
      end
    end
  end

  describe '#confirm_order' do
    it 'sends a payment confirmation text message' do
      allow(takeaway).to receive(:send_text)
      expect(takeaway).to receive(:send_text).with("Thanks! Your order has been placed, will cost £0 and will be delivered by 0")
      takeaway.confirm_order
    end
  end

end
