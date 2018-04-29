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

  it "should have an attribute reader total" do
    expect(takeaway.total).to eq 0
  end

  it "should have an attribute reader Basket" do
    expect(takeaway).to respond_to(:basket)
  end

  describe ' #add_to_basket ' do
    it "should return a confirmation of what has been added to basket" do
      expect(takeaway.add_to_basket(item, quantity)).to eq("Order confirmed: #{item} x#{quantity}")
    end

    it "should add item and quantity to the Basket's items hash" do
      takeaway.add_to_basket(item, quantity)
      expect(takeaway.basket.items).to eq({ item => quantity })
    end

    it "should raise an error if item is unavailable" do
      expect { takeaway.add_to_basket(:salmon, quantity) }.to raise_error("This item is unavailable")
    end
  end

  describe ' #receipt ' do
    it "should return a list of ordered items" do
      takeaway.add_to_basket(item, quantity)
      expect(takeaway.receipt).to eq("panda_pop (x2) --- £2, Total: £2.00")
    end
  end

end
