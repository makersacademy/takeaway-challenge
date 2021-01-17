require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Pizza - £5.00" }
  it "shows the menu with prices" do
    expect(takeaway.print_menu).to eq(print_menu)
  end
    
end
