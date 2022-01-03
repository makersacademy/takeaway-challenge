require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu, order: order) }

    let(:menu) { double(:menu, print: printed_menu) }
    let(:order) { instance_double("Order", total: 15.50) }
    let(:printed_menu) { "Menu Items List" }

    let(:dishes) { {chicken: 2, beef: 1} }

    it 'shows the menu with a list of dishes and prices' do
        expect(subject.print_menu).to eq(printed_menu)
    end 

    it 'can order a number of available dishes' do
        expect(order).to receive(:add).twice 
        takeaway.place_order(dishes)
    end

    it 'knows the order total' do
        allow(order).to receive(:add)
        total = takeaway.place_order(dishes)
        expect(total).to eq(15.50)
    end 
end 