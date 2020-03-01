require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe "#view_menu" do
    it "displays the menu" do
      expect { order.view_menu }.to output { /burger 10.0/ }.to_stdout
    end
  end

  describe "#add" do
    context "raises errors" do
      it "raises error if dish not available" do
        expect { order.add("pizza", 1) }.to raise_error "Dish not available. Please try again."
      end

      it "raises error if no quantity provided" do
        expect { order.add("burger", "1") }.to raise_error "Quantity not provided. Please try again."
      end
    end

    context "confirms items added to basket" do
      it "doesn't add 's' to dish names ending in 's'" do
        expect(order.add("fries", 3)).to eq "3 fries added to basket"
      end

      it "confirms single item was added to basket" do
        expect(order.add("burger", 1)).to eq "1 burger added to basket"
      end

      it "confirms mulitple items were added to basket" do
        expect(order.add("burger", 3)).to eq "3 burgers added to basket"
      end
    end
  end

  describe "#checkout" do
    before do
      order.add("burger", 2)
      order.add("fries", 3)
    end

    it "raises error if total doesn't match subtotal" do
      expect { order.checkout(10) }.to raise_error "Incorrect order total. Please try again."
    end

    it "sends the user a confimation message if order placed succesfully" do
      expect(order.checkout(32)).to eq "Thank you! Your order was placed and will be delivered before #{Time.now}"
    end
  end

  describe "#view_basket" do
    before do
      order.add("burger", 2)
      order.add("fries", 3)
    end

    it "displays the current basket" do
      expect { order.view_basket }.to output { "2 x burger @ 10.0: 20.0\n 3 x fries @ 4.0: 12.0" }.to_stdout
    end

    it "returns the basket subtotal" do
      expect(order.view_basket).to eq(32)
    end
  end
end
