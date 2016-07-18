require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "balti £5.00 , vindaloo £4.50" }

  it "prints out a list of menu items and their prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
