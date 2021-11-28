require 'checkout'
#require 'menu'

describe Checkout do
   
  describe "test view_basket" do

    context "with 1 item in the basket" do
      it "can show the 1 item" do
        basket1 = ["KFC", 6]
        receipt_list1 = [6]
        checkout = Checkout.new(basket1, receipt_list1)
        expect { checkout.view_basket }.to output(checkout.basket.to_s).to_stdout
      end
    end
   
   context "with 3 items in the basket" do
      it "can show the 3 item" do
        basket3 = [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]]
        receipt_list3 = [6, 10, 3]
        checkout = Checkout.new(basket3, receipt_list3)
        expect { checkout.view_basket }.to output(checkout.basket.to_s).to_stdout
      end
    end
  end
end
