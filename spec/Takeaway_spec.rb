require "Takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double:menu, print: printed_menu }
  let(:printed_menu) { "chicken balls: £3:50" }

  it "Shows the menu with prices and the dishes" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end
end
