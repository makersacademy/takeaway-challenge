require 'customer'

describe Customer do

  subject(:customer) { described_class.new }
  let(:item) { double('item') }
  let(:order) { double('order') }




  describe "#place_order" do

    it "delegates the placing of an order to the order object" do
      allow(order).to receive(:save_items).with(item).and_return 'order noted'
      expect(customer.place_order).to eq 'order noted'

    end


  end
end
