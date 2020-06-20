require 'take_away'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu)}
  let(:order) { double (:order) }
  let(:printed_menu) {"Egg Rice, £3.99"}
  let(:dishes) { {rice: 2, somosa: 1} }

    it 'shows menu with dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

    it 'selects some number of several available dishes and places order' do
      allow(order).to receive(:add)
      expect(takeaway.place_order(dishes)).to eq("Your order total is: £15.00")
    end

  end
