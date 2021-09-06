require "Takeaway"

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
    
    let(:menu) { double(:menu, print: printed_menu) }
    let(:order) { instance_double("Order", total: 49.85) }
    let(:sms) { instance_double("SMS", deliver: nil) }
    let(:printed_menu) { "Plaice: £7.25" }
    let(:dishes) { {Plaice: 2, Vegetable_Curry: 1} }
    
    before do
        allow(order).to receive(:add)
    end
    
    it 'displays menu of dishes and prices' do
        expect(takeaway.print_menu).to eq(printed_menu)
    end
    
    it 'orders several available dishes' do
        expect(order).to receive(:add).twice
        takeaway.place_order(dishes)
    end
    
    it 'displays total order' do
        total = takeaway.place_order(dishes)
        expect(total).to eq(49.85)
    end
    
    it 'sends SMS message when order placed' do
        expect(sms).to receive(:deliver)
        takeaway.place_order(dishes)
    end
end