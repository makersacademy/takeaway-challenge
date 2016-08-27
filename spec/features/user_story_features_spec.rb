require 'menu'


describe 'User stories for the takeaway challenge' do

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
 it 'so that I can order something, display a list of dishes with prices' do

   menu = Menu.new
   expect{menu.display_dishes}.not_to raise_error


 end




end
