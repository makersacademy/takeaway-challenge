require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  context '#print_menu' do
    let(:menu) { double :menu, print_menu: printed_menu }
    let(:printed_menu) { "Menu" }
    let(:order) { double :order }
    let(:dishes) { { pizza: 2, pasta: 1 } }
    it 'prints the menu from the menu class with the dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

    it 'can order some number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end
end
