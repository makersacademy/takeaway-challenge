require 'takeaway'

describe Takeaway do 


  let(:sms_instance) { instance_double("Sms") } 
  let(:sms) { double("Sms", new: sms_instance) }  
  let(:menu) {[{:item => "Papaya Salad", :price => 5},
  {:item => "Spring Rolls", :price => 5},
  {:item => "Noodles with grilled meats", :price => 5},
  {:item => "Rice noodles", :price => 1}, 
  {:item => "prawn salad", :price => 2}, 
  {:item => "coffee", :price => 2}]}
  # let(:takeaway) {Takeaway.new(menu)} 
  let(:food) {[{:item => "Rice noodles", :quantity => 1}, {:item =>"prawn salad", :quantity => 2}, {:item => "coffee", :quantity => 2}]}
  before(:each) do
    @takeaway = Takeaway.new(takeaway_menu: menu, sms_class: sms)  
    # our production code - takeaway.rb is run with the sms double. 
    #These are all keyword arguments, these are not key value pairs. 
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

  describe "#sends SMS" do
    it "sends an SMS to the user with the delivery confirmation" do
      @takeaway.order(food)
      expect(sms_instance).to receive(:send_sms)
      #double of sms to receive a function call of a stubbed method
      @takeaway.send_delivery_confirmation
    end 
  end 
end 