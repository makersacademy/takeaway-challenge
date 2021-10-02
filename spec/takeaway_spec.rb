require "takeaway"
require "menu"

RSpec.describe Takeaway do
  let(:menu) { double(:menu, print: dishes) }
  let(:dishes) { { "pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10 } }

  describe "#view_menu" do
    context "when customer wants to view a menu" do
      it "prints a menu" do
        takeaway = Takeaway.new(menu)
        expect(takeaway.view_menu).to eq(dishes)
      end
    end
  end
end
