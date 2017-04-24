require "kebabshop"

describe Kebabshop do
  subject(:kebabshop) { described_class.new }
  kebabs = Kebabshop::KEBABS


  it "checks to see a list of dishes with prices" do
  expect(kebabshop.check_menu).to eq kebabs
  end

  it "checks to see if cart is empty" do
      expect(kebabshop.cart).to eq []
  end

  describe "#Ordering" do

    it "adds selected kebab kebab to your cart" do
      kebabshop.place_order("Adana kebab",1)
      expect(kebabshop.cart).to include "Adana kebab"
    end

  end














end
