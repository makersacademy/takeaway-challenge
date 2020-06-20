require 'take_away'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: printed_menu)}
  let(:printed_menu) {"Egg Rice, £3.99"}

    it 'shows menu with dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

  end
