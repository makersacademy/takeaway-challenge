require 'takeaway'

RSpec.describe Takeaway do
  let(:menu) { double :menu, dishes: menu_items, print_menu: menu_items }
  let(:menu_items) { { "Classic Chicken": 9.95 } }

  subject(:takeaway) { described_class.new(menu) }

  it 'prints the menu' do
    expect(takeaway.print_menu).to eq menu.print_menu
  end
end
