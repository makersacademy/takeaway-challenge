require 'order'

describe Order do
  subject(:order) { described_class.new(textbotdouble) }
  let(:textbotdouble) { double(:textbot, checkout: nil, sendmessage: nil) }
  let(:sampleorder) { 'gimlet' }
  let(:sampleamount) { 1 }


  describe "#order" do
    it "responds to #order method" do
      expect(order).to respond_to(:order).with(2)
    end

    it "adds item and amount to the baskets" do
      order.order(sampleorder, sampleamount)
      expect(order.basket).to_not be_empty
    end
  end

  describe "#basket" do
    it "responds to #basket method" do
      expect(order).to respond_to(:basket)
    end

    it "starts with an empty basket" do
      expect(order.basket).to be_empty
    end

    it "stores items in the basket" do
      order.order(sampleorder, sampleamount)
      expect(order.basket[0]).to be sampleorder
    end
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(order).to respond_to(:checkout).with(1)
    end

    it "delegates to the textbot object" do
      expect(textbotdouble).to receive(:sendmessage)
      order.checkout(0)
    end
  end
end
