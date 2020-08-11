require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu, order: order) }

    let(:menu) { double(:menu, print: printed_menu) }
    let(:order) { double(:order, total: 21.00) }

    let(:printed_menu) { 'Salad: £5' }

    let(:dishes) { {salad:1, pizza: 2} }

    it 'shows menu with dishes and prices' do
        expect(takeaway.print_menu).to eq(printed_menu) 
    end 
    it 'orders some number of several dishes available' do
        expect(order).to receive(:add).twice
        takeaway.place_order(dishes)
    end 

    it 'confirms the total amount of order' do
        allow(order).to receive(:add)
        total = takeaway.place_order(dishes)
        expect(total).to eq(21.00)
    end 

    
end

