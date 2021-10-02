require 'takeaway'

describe Takeaway do 
  
  let(:menu) {[{:item => "Papaya Salad", :price => 5},
  {:item => "Spring Rolls", :price => 5},
  {:item => "Noodles with grilled meats", :price => 5},
  {:item => "Rice noodles", :price => 1}, 
  {:item => "prawn salad", :price => 2}, 
  {:item => "coffee", :price => 2}]}
  let(:takeaway) {Takeaway.new(menu)} 

  describe "#see menu" do 
    it "allows you to see the menu of dishes with prices" do
    expect(takeaway.see_menu).to eq(menu)
    end
  end
  
  describe "#order method" do
    it "allows you to select a number of available dishes from the menu" do
 
      food = [{:item => "Rice noodles", :quantity => 1}, {:item =>"prawn salad", :quantity => 2}, {:item => "coffee", :quantity => 2}]
      expect(takeaway.order(food)).to be_truthy
    end
  end  
end 