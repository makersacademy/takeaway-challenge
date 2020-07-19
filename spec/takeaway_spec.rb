require "takeaway"

describe Takeaway do
  subject(:takeaway) {described_class.new(menu: menu)}
  
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Rice: £4.00" }
  
  it "knows the menu" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end