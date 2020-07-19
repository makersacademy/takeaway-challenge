require 'takeaway'

describe Takeaway do
    
    subject(:takeaway) { described_class.new(menu: menu) }
    let(:menu) { double(:menu, print: print) } 
    let(:print) { "Here is a list of the dishes" }

    it "print out a list of the dishes on the menu" do
      expect(takeaway.print).to eq("Here is a list of the dishes")
    end

    # it "select some number of of several available dishes" do
    #     expect(takeaway.select).to 
    # end
end