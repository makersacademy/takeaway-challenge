require 'order'
require 'menu'

describe Order do
  
  context "Ordering dishes" do
    
    it "should be able to keep track of ordered dishes" do
      subject.order("Fish")
      expect(subject.customer).to include "Fish"
    end
  end
  
  context "Calculating total price of the order" do
    
    it "should calculate the total cost of the order" do
    end
    
  end
  
  context "User errors" do
    
    it "should raise and error when user tries to order something not in the menu" do
    end
    
  end
end