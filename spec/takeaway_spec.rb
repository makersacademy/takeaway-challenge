require 'takeaway'

describe Takeaway do 
    subject(:takeaway) {described_class.new(menu: menu)}
    
    let(:menu) {double(:menu, print: printed_menu)}
    let(:printed_menu) { "Fish and Chips: £1.50"}

    it 'shows menu with dishes & prices' do 
        expect(takeaway.show_menu).to eq(printed_menu)
    end 
end 


 