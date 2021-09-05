require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu, order: order) }
    
    let(:menu) { double(:menu, print: printed_menu) }
    let(:order) { double(:order) }
    let(:printed_menu) { "Beef £3.99, Fish £4.50, Sausage £1.99" }

    let(:dishes) { {beef: 3, sausage: 2} }

    it 'see the menu with dishes with prices' do
        expect(takeaway.print_menu). to eq(printed_menu)
    end
    
    it 'order several available dishes' do
        allow(order).to receive(:add)
        expect(takeaway.place_order(dishes)).to eq(dishes)
    
    end


end