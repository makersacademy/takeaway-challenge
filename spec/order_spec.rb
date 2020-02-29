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

    context "order" do
      it "adds the dish and quantities to the order" do
        order.add("burger", 2)
        expect(order.dishes).to eq [{ dish: "burger", quantity: 2 }]
      end

      it "subtotals the order" do
        order.add("burger", 2)
        order.add("fries", 3)
        expect(order.subtotal).to eq 32
      end
    end

    context "confirms dish added" do
      it "confirms 1 item was added to order" do
        expect(order.add("burger", 1)).to eq "1 x burger added to order"
      end

      it "confirms mulitple items were added to order" do
        expect(order.add("burger", 3)).to eq "3 x burgers added to order"
      end
    end
  end

  describe "#place" do
    before do
      order.add("burger", 2)
      order.add("fries", 3)
    end

    it "raises error if total doesn't match subtotal" do
      expect { order.place(10) }.to raise_error "Incorrect order total. Please try again."
    end

    it "sends the user a confimation message" do
      expect(order.place(32)).to eq "Thank you! Your order was placed and will be delivered before #{Time.now}"
    end
  end
end
