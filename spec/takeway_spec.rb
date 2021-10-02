require 'takeaway'

describe Takeaway do 
  
  let(:menu) {[{:item => "Papaya Salad", :price => 5},
  {:item => "Spring Rolls", :price => 5},
  {:item => "Noodles with grilled meats", :price => 5}]}
  let(:takeaway) {Takeaway.new(menu)} 

  describe "#see menu" do 
    it "allows you to see the menu of dishes with prices" do

    expect(takeaway.see_menu).to eq(menu)
    end
  end  
end 