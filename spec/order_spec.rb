require "order"

describe "order" do

  let(:order) { Order.new }

  describe "#initialize" do
    it "should create an empty basket" do
      expect(order.basket).to be_empty
    end
  end





end
