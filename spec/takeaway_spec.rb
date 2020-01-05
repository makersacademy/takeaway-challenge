require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "Burger - £5.99"}

  it 'shows the menu and prices' do
    expect(takeaway.show_menu).to eq(printed_menu)
  end
end