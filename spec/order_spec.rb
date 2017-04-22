require "order"

describe Order do

  let(:order) { described_class.new }

  describe "#creates a dish order" do

    it "sets up a new order" do
      expect(order).to be_an_instance_of(Order)
    end

    it "contains a list to store an item" do
      expect(order.items).to eq []
      expect(order.total).to include "total"
    end
  end

  describe "#adds a dish from the menu to the order" do

    it "can add a dish" do
      expect(order).to respond_to(:add).with(1).argument
    end

    #
    # do
    #   allow(takeaway).to receive(:menu).and_return{ :chicken_balti => 6.50 }
    #   expect(order.add(:saag_aloo).to eq order.items[0]
    # end
  end


end
