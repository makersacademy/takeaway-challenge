require "takeaway"

RSpec.describe Takeaway do
  let(:takeaway) { described_class.new }

  describe "#initialize" do
    it { expect(takeaway).to be_instance_of(Takeaway) }

    describe "#initialize arguments" do
      it { expect(described_class).to respond_to(:new).with(2).arguments }
     
      it "to create new instance of Menu class" do
        expect(takeaway.menu).to be_instance_of(Menu)
      end

      it "to create new instance of Order class" do
        expect(takeaway.order).to be_instance_of(Order)
      end
    end
  end

  describe "#open_menu" do
    it "displays the list of items and prices to the customer" do
      expect(takeaway.open_menu).to include("Sausage: £0.80")
    end
  end

  describe "#add_to_order" do
    it { expect(takeaway).to respond_to(:add_to_order) }

    it "should add an item to the order basket" do
      expect { takeaway.add_to_order("Large Fish", 2) }.to change { takeaway.order.basket.length }.by(1) 
    end

    it "should add multiple items to the order basket" do
      takeaway.add_to_order("Small Chips", 3)
      takeaway.add_to_order("Sausage", 1)
      expect(takeaway.order.basket.length).to eq(2) 
    end
  end

  describe "#view_basket" do
    it { expect(takeaway).to respond_to(:view_basket) }

    it "should display items currently in the basket" do
      takeaway.add_to_order("Small Chips", 3)
      takeaway.add_to_order("Sausage", 1)
      expect(takeaway.view_basket).to eq("x3 Small Chips(£1.20) = £3.60, x1 Sausage(£0.80) = £0.80")
    end
  end

  describe "#order_total" do
    it { expect(takeaway).to respond_to(:order_total) }

    it "should return total cost of the order" do
      takeaway.add_to_order("Small Fish", 17)
      takeaway.add_to_order("Small Chips", 17)
      expect(takeaway.order_total).to eq("Total Order Cost: £51.00")
    end
  end

  describe "#checkout" do
    it { expect(takeaway).to respond_to(:checkout).with(1).argument }

    it "should throw an error if amount is incorrect" do
      takeaway.add_to_order("Small Chips", 3)
      takeaway.add_to_order("Sausage", 1)
      takeaway.order_total  
      expect { takeaway.checkout(3.60) }.to raise_error(RuntimeError, "Wrong amount")
    end
  end

end
