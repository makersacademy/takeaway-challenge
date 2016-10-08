require 'takeaway'

describe Takeaway do
    
    subject(:takeaway) {described_class.new}
    
    it 'shows the menu with the dishes and prices' do
       expect(takeaway.print_menu).to eq("Ratkajino: 5 isk") 
    end
end