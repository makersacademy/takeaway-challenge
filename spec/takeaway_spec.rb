require 'takeaway'
describe Takeaway do
    #let(:takeaway) { Takeaway.new(menu) }
    let(:menu_double) { double(:menu, {print: printed_menu}) }
    let(:printed_menu) { 'Chicken: £3.00'}
    let(:order_double) { double(:order, total: 10.00) }
    let(:dishes) { {chicken: 2, fish: 1} }
    it 'shows menu with prices' do
        expect(Takeaway.new(menu_double, order_double).print_menu).to eq(printed_menu)
    end

    it 'can order some number of serveral dishes' do
        allow(order_double).to receive(:add).twice
        Takeaway.new(menu_double, order_double).place_order(dishes)
    end

    it 'knows the order total' do
        allow(order_double).to receive(:add)
        total = Takeaway.new(menu_double, order_double).place_order(dishes)
        expect(total).to eq(10.00)
    end
    
end