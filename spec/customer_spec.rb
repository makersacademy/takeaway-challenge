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


end
