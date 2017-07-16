require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:sampleorder) { 'Gimlet' }
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
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(order).to respond_to(:checkout)
    end
  end
end
