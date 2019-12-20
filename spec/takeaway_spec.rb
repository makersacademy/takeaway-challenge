require './lib/takeaway'

describe Takeaway do

  # Takeaway tests should not depend on another class, so I will create
  # these "fakes" expecting these will exist on the menu class that will be created later and whos
  # responsibility it will be to handle the menu and its items.
  subject(:takeaway) { described_class.new(menu_items: menu_items) }

  # create a menu double to use in place of menu class, expect
  # displayed_menu ........
  let(:menu_items) { double(:menu_items, display: displayed_menu) }

  # ......... to display the text output
  let(:displayed_menu) { "Pepperoni Pizza" }

  describe "#display_menu_items" do
    context "Displayts the menu to the user" do
      it "returns a menu list" do
        expect(subject.display_menu_items).to eq(displayed_menu)
      end
    end
  end
end