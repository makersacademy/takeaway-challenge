require 'checkout'
require 'menu'

describe Checkout do
   
  describe "test view_basket" do
    let!(:checkout) { Checkout.new }
    # view basket needs a fake basket to be tested
    let!(:basket1) { double :basket1 => ["KFC", 6] }
    let!(:basket3) { double :basket3 => [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]] }

    context "with 1 item in the basket" do
      it "can show the 1 item" do
        expect(checkout.view_basket).to be(@basket1)
      end
    end
   
    context "with 3 items in the basket" do
      it "can show the 3 items" do
        expect(checkout.view_basket).to be(@basket3)
      end
    end
  end

  describe "test calculate_total" do
    let!(:checkout) { Checkout.new } 
    # calculate total needs a fake receipt to be tested
    let!(:receipt_list1) { [6] }
    let!(:receipt_list3) { [6, 10, 3] }

    context "with 1 item in the basket" do
      it "return the item price" do
        expect(checkout.calculate_total(receipt_list1)).to eq 6
      end
    end
   
    context "with 3 items in the basket" do
      it "calculated the sum of the 3 items' prices" do
        expect(checkout.calculate_total(receipt_list3)).to eq 19
      end
    end
  end
end
