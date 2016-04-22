require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: printed_menu)}
  let(:printed_menu) { "Gambas: £10.9" }
  
  it "prints the menu" do
    expect(takeaway.print_menu).to eq printed_menu
  end
  
  it "selects some number of several available dishes" do
    
  end
end