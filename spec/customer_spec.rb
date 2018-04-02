require 'customer'

describe Customer do

  subject(:customer) { described_class.new }
  let(:items) { double('item') }
  let(:order) { double('order') }




  describe "#place_order" do

    it "delegates the placing of an order to the order object" do
      allow(order).to receive(:save_items).with(items).and_return 'order noted'
      expect(customer.place_order).to eq 'order noted'

    end

  end

    describe "#verify_order" do
      it "delegates the verification of the order to the order object" do
        allow(order).to receive(:check_order).with(items).and_return 'order verified'
        expect(customer.verify_order).to eq 'order verified'

      end
    end

    describe "#finish_order" do
      before(:each) do
        allow(order).to receive(:send_confirmation_text)
      end

      it "delegates sending order confirmation message to order object" do
        customer.finish_order
        expect(order).to receive(:send_confirmation_text)
      end
      it "creates a new order object" do
        expect(customer.finish_order).to be_an_instance_of Order
      end
    end


end
