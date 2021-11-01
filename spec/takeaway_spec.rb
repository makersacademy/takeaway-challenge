require 'takeaway'

describe Takeaway do 
    subject(:takeaway) {described_class.new(menu: menu, order: order)}
    
    let(:menu) {double(:menu, print: printed_menu)}
    let(:printed_menu) { "Fish and Chips: £1.50"}
    let(:order) {double(:order) }

    let(:dishes) { {fish: 1, chips: 1 }}

    it 'shows menu with dishes & prices' do 
        expect(takeaway.show_menu).to eq(printed_menu)
    end 

    it "can order some number of available dishes" do
        expect(order).to receive(:add).twice
        takeaway.place_order(dishes)
end 
end 


 