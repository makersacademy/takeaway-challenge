require 'takeaway'
describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "yum: £3" }
  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq("yum: £3")

  end
end
