require 'order'

describe Order do

  subject(:order) { described_class.new(menu, basket) }
  let(:menu) { double :menu }
  let(:basket) { double :basket }

  describe "#view_menu" do
    it "displays the menu" do
      allow(menu).to receive(:view)
      order.view_menu
    end
  end

  describe "#add" do
    context "raises errors" do
      it "raises error if dish not available" do
        allow(menu).to receive(:dish_available?).with("pizza").and_raise "Dish not available. Please try again."
        expect { order.add("pizza", 1) }.to raise_error "Dish not available. Please try again."
      end

      it "raises error if no quantity provided" do
        expect { order.add("burger", "1") }.to raise_error "Quantity not provided. Please try again."
      end
    end

    context "confirms items added to basket" do
      before do
        allow(basket).to receive(:update)
        allow(basket).to receive(:update_subtotal)
        allow(menu).to receive(:dish_available?).and_return true
      end

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

  describe "#view_basket" do
    it "displays the current basket" do
      allow(basket).to receive(:print)
      order.view_basket
    end
  end

  describe "#checkout" do
    it "raises error if total doesn't match subtotal" do
      allow(basket).to receive(:subtotal).and_return(20)
      expect { order.checkout(10) }.to raise_error "Incorrect order total. Please try again."
    end

    it "sends the user a confimation message if order placed succesfully" do
      allow(basket).to receive(:subtotal).and_return(32)
      expect(order.checkout(32)).to eq "Thank you! Your order was placed and will be delivered before #{Time.now}"
    end
  end

end
