require 'takeaway'

describe Takeaway do

  let(:takeaway) { subject }
  let(:item) { :panda_pop }
  let(:quantity) { 2 }
  let(:menu) { { potato_smilies: 2,
                 turkey_twizzlers: 3,
                 rice_pudding: 3,
                 panda_pop: 1,
                 spaghetti_hoops: 1
                 } }

  it "should have an attribute reader menu" do
    expect(takeaway.menu).to eq menu
  end

  it "should have an attribute reader Basket" do
    expect(takeaway).to respond_to(:basket)
  end

  describe ' #order ' do
    it "should return a confirmation of the order" do
      expect(takeaway.order(item, quantity)).to eq("Order confirmed: #{item} x#{quantity}")
    end

    it "should add item and quantity to the Basket's orders" do
      takeaway.order(item, quantity)
      expect(takeaway.basket.orders).to eq({ item => quantity })
    end

    it "should raise an error if item is unavailable" do
      expect { takeaway.order(:salmon, quantity) }.to raise_error("This item is unavailable")
    end
  end

end
