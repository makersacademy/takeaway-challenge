require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  
  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Menu List" }

  it "Displays the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq(print_menu) 
  end
end

