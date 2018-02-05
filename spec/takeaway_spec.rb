require 'Takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Menu.new) }
  subject(:message) { described_class.new }
  let(:send_text) { double "send_sms" }
  let(:place_order) { double("dish", 2) }

  describe "#initialize" do
    it "returns the menu" do
      expect(takeaway.menu).not_to be_nil
    end
  end
  describe "#show_menu" do
    it "shows the menu" do
      expect(takeaway.show_menu).not_to be_nil
    end
  end
  describe "#place_order" do
    before(:each) do
      takeaway.show_menu
    end
    it "place the order" do
      allow(takeaway).to receive(:place_order).with(2).and_return(:default)
    end
  end
  describe "#sub_total" do
    before(:each) do
      takeaway.show_menu
      takeaway.place_order("dish", 2)
    end
    context "When total price of a selected dish is displayed" do
      it "displays the price of dish" do
        expect(takeaway.sub_total).not_to be_empty
      end
    end
  end
  describe "#total_amount" do
    before(:each) do
      takeaway.show_menu
      takeaway.place_order("dish", 2)
      takeaway.sub_total
    end
    context "When total amount of order is displayed" do
      it "displays total amount" do
        expect(takeaway.total_amount).not_to be_nil
      end
    end
  end
  describe "#complete_order" do
    context "When price is not equal to total amount" do
      it "raises an error" do
        allow(takeaway).to receive(:confirm_order).with(1).and_return("Sorry, sum is not correct")
      end
      it "sends a message if total amount is correct" do
        allow(message).to receive(:send_sms).and_return("message")
        expect(message.send_sms).not_to be_empty
      end
    end
  end
end
