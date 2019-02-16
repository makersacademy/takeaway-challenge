require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Vindaloo: £6" }

  it "shows a list of dishes with prices" do
    expect(takeaway.read_menu).to eq(print_menu)
  end
end
