require "takeaway"

RSpec.describe Takeaway do
  let(:menu) { double(:menu, print: dishes) }
  let(:dishes) { { pepperoni: 8, veggie: 8 } }
  # let(:menu) { Menu.new("pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10, "side salad" => 3) }

  describe "#view_menu" do
    context "when customer wants to view a menu" do
      it "prints a menu" do
        takeaway = Takeaway.new(menu)
        # menu = double("Menu", :pepperoni => 8, :veggie => 8, :hawaiian => 9)
        expect(takeaway.view_menu).to eq(dishes)
      end
    end
  end
end
