require 'takeaway'

describe Takeaway do 
  takeaway = Takeaway.new

  describe "#see menu" do 
    it "allows you to see the menu of dishes with prices" do
    expect(takeaway.see_menu).to eq(takeaway.menu)
    end
  end  
end 