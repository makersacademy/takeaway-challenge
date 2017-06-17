
require_relative "../lib/takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order, message)}

  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:message) { double(:message) }

   describe "attributes" do
    it {is_expected.to respond_to(:menu)}
    it {is_expected.to respond_to(:order)}
    it {is_expected.to respond_to(:message)}

      context "on init" do
        describe "@menu" do
          it "will default to my menu class" do
            expect(takeaway.menu).to be menu
          end
        end
        describe "@order" do
          it "will default to my order class" do
            expect(takeaway.order).to be order
          end
        end
        describe "@message" do
          it "will default to my message class" do
            expect(takeaway.message).to be message
          end
        end
     end
   end

   describe "#see_menu" do
     it "asks the menu to show its dishes" do
       allow(menu).to receive(:show_dishes)
       expect(menu).to receive(:show_dishes)
       takeaway.show_menu
     end
   end

   describe "#add" do
     context "when user tries to order a dish not on menu" do
       it "fails with a descriptive message" do
         allow(menu).to receive(:has?).with(:Truffles).and_return(nil)
         expect{takeaway.add(:Truffles)}.to raise_error("That's not on the menu!")
       end
     end
     context "when user orders a dish on menu" do
       it "adds the dish to the order" do
         allow(menu).to receive(:has?).with(:Pizza).and_return([:Pizza, 10.0])
         expect(order).to receive(:add).with(:Pizza, 1)
         takeaway.add(:Pizza)
       end
     end
   end

   describe "#checkout" do
     context "when user pays too little" do
       it "fails with descriptive error message" do
         allow(order).to receive(:total).and_return(10.00)
         expect{takeaway.checkout(5.0)}.to raise_error("You're short. Please pay the correct sum man.")
       end
     end
   end

   describe "summary" do
     it "asks the order to show its basket" do
       allow(order).to receive(:summary)
       expect(order).to receive(:summary)
       takeaway.summary
     end
   end


end
