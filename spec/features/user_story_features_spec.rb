require 'menu'
require 'order'

describe 'user feature tests' do

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
  describe 'list of available dishes' do

   it 'so that I can order something, display a list of dishes with prices' do
     menu = Menu.new
     expect{menu.display_dishes}.not_to raise_error
   end
 end

 #As a customer
 #So that I can order the meal I want
 #I would like to be able to select some number of several available dishes
  describe 'selecting dishes from a menu' do
   it 'selects dishes from the menu' do
     menu = Menu.new
     menu.display_dishes
     order = Order.new
     expect{order.select_dishes("chicken", 2)}.not_to raise_error
   end
 end

 #As a customer
 #So that I can verify that my order is correct
 #I would like to check that the total
 #I have been given matches the sum of the various dishes in my order

 describe 'checking the total price of the order' do
       it 'displays the total price of the order' do
       menu = Menu.new
       order = Order.new
       order.select_dishes("chicken", 2)
       order.select_dishes("steak", 2)
       order.select_dishes("chips", 2)
       expect(order.total_price).to eq 26
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
