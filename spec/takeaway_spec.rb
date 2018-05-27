require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  context '#print_menu' do
    let(:menu) { double :menu, print_menu: printed_menu }
    let(:printed_menu) { "Menu" }
    it 'prints the menu from the menu class with the dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

    it 'prints a list of dishes with prices' do
    end
  end
end
