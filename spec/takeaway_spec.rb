require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu) }
    
    let(:menu) { double(:menu, print: printed_menu) }
    let(:printed_menu) { "Beef £3.99, Fish £4.50, Sausage £1.99" }

    it 'see the menu with dishes with prices' do
        expect(takeaway.print_menu). to eq(printed_menu)
    end


end