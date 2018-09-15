require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu_class) }
  let(:menu_class) { double :menu_class, printing_menu: printed_menu }
  let(:printed_menu) { "Pasta: 4.50" }

  describe '#print_menu' do
    it 'shows the menu including dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end
end
