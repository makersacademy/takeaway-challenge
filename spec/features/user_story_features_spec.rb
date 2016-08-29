require 'menu'
require 'order'
require 'takeaway'

describe 'user feature tests' do

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
  describe 'list of available dishes' do

   it 'so that I can order something, display a list of dishes with prices' do
     t = Takeaway.new
     expect{t.show_menu}.not_to raise_error
   end
 end

 #As a customer
 #So that I can order the meal I want
 #I would like to be able to select some number of several available dishes
  describe 'selecting dishes from a menu' do
   it 'selects dishes from the menu' do
     t = Takeaway.new
     t.show_menu
     expect{t.add("chicken", 2)}.not_to raise_error
   end

   it 'raises an error if an unknown dish is chosen' do
     t = Takeaway.new
     t.show_menu
     expect{t.add("rice", 2)}.to raise_error
   end
 end

 #As a customer
 #So that I can verify that my order is correct
 #I would like to check that the total
 #I have been given matches the sum of the various dishes in my order

 describe 'checking the total price of the order' do
       it 'displays the total price of the order' do
       t = Takeaway.new
       t.add("chicken", 2)
       t.add("steak", 2)
       t.add("chips", 2)
       expect(t.order_price).to eq "Your total order price is £26"
   end
 end



#As a customer
#So that I am reassured that my order will be delivered on time
#I would like to receive a text such as
#"Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'Confirmation of the order' do

    it 'confirms the order has been placed' do

    end

  end
end
