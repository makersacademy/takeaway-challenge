
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


end
