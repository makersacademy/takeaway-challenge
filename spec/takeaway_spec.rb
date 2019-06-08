require 'takeaway'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

#menu double and added method double for display
  let(:menu) { double(:menu, display: printed_menu) }
  let(:printed_menu) { "Chicken: £3.50" }

  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
