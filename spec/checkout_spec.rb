require 'checkout'
#require 'menu'

describe Checkout do
   
  describe "test view_basket" do
    context "with 1 item in the basket" do
      before do
        # instantiate checkout with fake variable to not use the instance variables of the Menu class
        # does it need to be a double as it can be passed directly? no need to mock a behaviour
        basket1 = ["KFC", 6]
        receipt_list1 = [6]
        @checkout = Checkout.new(basket1, receipt_list1)
      end

      it "outputs the basket with 1 item in it" do
        expect { @checkout.view_basket }.to output(@checkout.basket.to_s).to_stdout
      end
    end
   
    context "with 3 items in the basket" do
      before do
        basket3 = [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]]
        receipt_list3 = [6, 10, 3]
        @checkout = Checkout.new(basket3, receipt_list3)
      end

      it "outputs the basket with 3 items in it" do
        expect { @checkout.view_basket }.to output(@checkout.basket.to_s).to_stdout
      end
    end
  end

  describe "test calculate_total" do
    context "with 1 item in the basket" do
      before do
        # instantiate checkout with fake variable to not use the instance variables of the Menu class
        # does it need to be a double as it can be passed directly? no need to mock a behaviour
        basket1 = ["KFC", 6]
        receipt_list1 = [6]
        @checkout = Checkout.new(basket1, receipt_list1)
      end

      it "can show the 1 item" do
        expect(@checkout.calculate_total).to eq 6
      end
    end
   
    context "with 3 items in the basket" do
      before do
        basket3 = [["KFC", 6], ["Bibimba_chicken", 10], ["Rice", 3]]
        receipt_list3 = [6, 10, 3]
        @checkout = Checkout.new(basket3, receipt_list3)
      end

      it "can show the 3 item" do
        expect(@checkout.calculate_total).to eq 19
      end
    end
  end
end
