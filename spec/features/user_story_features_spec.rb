require 'menu'


describe 'user feature tests' do

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
 it 'so that I can order something, display a list of dishes with prices' do
   menu = Menu.new
   expect{menu.display_dishes}.not_to raise_error
 end

 #As a customer
 #So that I can order the meal I want
 #I would like to be able to select some number of several available dishes

 it 'selects dishes from the menu' do
   menu = Menu.new
   menu.display_dishes
   order = Order.new
   expect{order.select_dishes("chicken", 2)}.not_to raise_error
 end
end
