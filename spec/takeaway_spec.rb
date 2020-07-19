require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu) }
    
    let(:menu) { double(:menu, print: print_list) } 
    let(:print_list) { "Here is a list of the dishes" }

    it "list of the dishes and their prices on the menu" do
      expect(takeaway.print_list).to eq(print_list)
    end

    # it "select some number of of several available dishes" do
    #     expect(takeaway.select).to 
    # end
end