require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hotdog: £5.00" }

  it "Instantiates a new class" do
    expect(takeaway).to be_a_kind_of Takeaway
  end

  it "shows the menu when called" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

end
