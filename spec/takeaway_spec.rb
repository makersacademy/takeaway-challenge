require 'takeaway'

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu) }
let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu) {"Yummy: 2.00"}
  #context '#show_menu' do
    it 'shows the menu with dishes and prices' do
      expect(takeaway.show_menu).to eq(printed_menu)
    end

  #end

end
