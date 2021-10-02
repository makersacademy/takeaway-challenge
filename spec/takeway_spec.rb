require 'takeaway'

describe Takeaway do 
  
  let(:menu) {[{:item => "Papaya Salad", :price => 5},
  {:item => "Spring Rolls", :price => 5},
  {:item => "Noodles with grilled meats", :price => 5},
  {:item => "Rice noodles", :price => 1}, 
  {:item => "prawn salad", :price => 2}, 
  {:item => "coffee", :price => 2}]}
  # let(:takeaway) {Takeaway.new(menu)} 
  let(:food) {[{:item => "Rice noodles", :quantity => 1}, {:item =>"prawn salad", :quantity => 2}, {:item => "coffee", :quantity => 2}]}
  before(:each) do
    @takeaway = Takeaway.new(menu)
    #each test should run independently, and shouldn't matter in its order. 
    #if you use the same instance of takeaway for each of the test, but one test could 
    #be setting the instance which could influence the test. 
    #may be better than having instance variabes - which are the same object.
  end 
  describe "#see menu" do 
    it "allows you to see the menu of dishes with prices" do
    expect(@takeaway.see_menu).to eq(menu)
    end
  end
  
  describe "#order method" do
    it "allows you to select a number of available dishes from the menu" do
      expect(@takeaway.order(food)).to be_truthy
    end
  end
  
  describe "#total method" do 
    it "sums up all of the prices in the order" do
      @takeaway.order(food)
      expect(@takeaway.total).to eq(9)
    end 
  end 
end 