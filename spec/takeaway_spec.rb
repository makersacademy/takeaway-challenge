require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "Pancakes: £4" }

  it 'shows the menu with list of dishes and prices' do
    expect(takeaway.show_menu).to eq(printed_menu)
  end

end
