require 'checkout'
require 'menu'

describe Checkout do
   
  describe "test view_basket" do
    let!(:checkout) { Checkout.new } 
    let!(:basket1) { double :basket1 => ["KFC", 6] }
    let!(:basket3) { double :basket1 => [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]] }

    context "with 1 item in the basket" do
      before do
        allow(checkout).to receive(:basket1).and_return(["KFC", 6])
      end

      it "can show the 1 item" do
        expect(checkout.view_basket).to be(@basket1)
      end
    end
   
    context "with 3 items in the basket" do
      before do
        allow(checkout).to receive(:basket3).and_return([["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]])
      end

      it "can show the 3 items" do
        expect(checkout.view_basket).to be(@basket3)
      end
    end
  end
end
