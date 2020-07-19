require 'takeaway'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu){double(:menu, print: printed_menu)}
  let(:order) { double(:order)}
  let(:printed_menu) {"Avocado salad: £4.50"}
  let(:dishes) {{avocado: 2, lentils: 1}}

    it 'shows the menu with dishes and prices' do
      expect(takeaway.printed_menu).to  eq(printed_menu)
    end
    it 'order a number of dishes available' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end
