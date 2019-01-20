require 'takeaway'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }

  let(:menu) { double :menu, dishes: menu_items, print_menu: printed_menu }
  let(:menu_items) { { "Classic Chicken": 9.95 } }
  let(:printed_menu) { "Classic Chicken £9.95" }

  describe '#print_menu' do
    it 'prints the menu' do
      expect(takeaway.print_menu).to eq printed_menu
    end
  end
end
