require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu)}

  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Chicken, £3.50" }
  it 'shows the menu with the dishes and prices' do
    expect(takeaway.print_menu).to eq("Chicken, £3.50")
  end

end
