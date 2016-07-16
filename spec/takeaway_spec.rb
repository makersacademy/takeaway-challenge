require "takeaway"

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "Menu item: £3" }

  it "Shows menu items with prices" do
    expect(takeaway.show_menu).to eq "Menu item: £3"
  end

end
