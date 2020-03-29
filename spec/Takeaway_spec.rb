require_relative '../lib/Takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "wonton: 3.50" }

  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

end
