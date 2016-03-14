require "takeaway"

describe Takeaway do

  TEST_MENU = { "Won Ton" => 3.70,
                "Chicken and Noodle Soup" => 1.90,
                "Pork Chow Mein" => 4.60,
              }

  subject(:takeaway){described_class.new(menu: TEST_MENU, notification_class: notification_class)}
  let(:notification_class) {double(:notification_class, new: notification)}
  let(:notification){double(:notification)}

  describe "before order" do

    it "returns an item and its price" do
      expect(takeaway.menu).not_to be_empty
    end

    it "returns empty basket message" do
      expect(takeaway.basket_summary).to eq "Your basket is empty"
    end
  end

  describe "adds menu items to basket" do

    it "adds one item by default" do
      expect(takeaway.order("Won Ton")).to eq "1x Won Ton added to your basket."
    end

    it "adds an item multiple times" do
      expect(takeaway.order("Won Ton", 2)).to eq "2x Won Ton added to your basket."
    end

    context "orders multiple items" do

      before do
        takeaway.order("Won Ton", 3)
        takeaway.order("Pork Chow Mein")
      end

      it "returns a total" do
        expect(takeaway.total).to eq "Total: 15.7" #to do - handle currency correctly
      end

      it "returns a basket summary" do
        expect(takeaway.basket_summary).to eq "Won Ton x 3 = 11.1,Pork Chow Mein x 1 = 4.6"
      end
    end

    context "invalid order" do

      it "raises an error if item is invalid" do
        expect do
          takeaway.order("Mozarella and Basil Pasta")
        end.to raise_error "This item isn't on the menu."
      end

      it "raises an error if too many of the same dish" do
        expect do
          takeaway.order("Won Ton", 11)
        end.to raise_error "For larger orders please phone us directly."
      end
    end
  end
  # context "removes menu items"
  describe "places an order" do
      it "sends a text message confirmation" do
        expect(notification).to receive(:send_sms).with("Thank you for your order. Your meal will arrive by #{(Time.now + 60 * 60).asctime.split[3]}!")
        takeaway.confirm_order
      end
  end
end