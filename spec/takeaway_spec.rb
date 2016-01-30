require "takeaway"

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu) } # CHECK
  let(:menu) { double(:menu, print: printed_menu) } # CHECK Doubles
  let(:printed_menu) { "Chicken: €3.50" }

  describe '#print_menu' do
    it 'prints the menu with dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

end
