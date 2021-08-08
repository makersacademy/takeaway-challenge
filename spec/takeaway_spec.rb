require 'takeaway'

describe Takeaway do
  
  subject(:takeaway) { described_class.new(menu: menu) }
  
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Chicken Karahi: £6" }
  
  
  it 'shows the menu with the dishes and prices' do
    expect(takeaway.display_menu).to eq(printed_menu)
  end
  
end
