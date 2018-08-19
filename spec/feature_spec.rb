# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct

### Not sure if i understand what is being asked on this one
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

#
# #feature tests
# require './lib/takeaway.rb'
# require './lib/menu.rb'
# menu = Menu.new
# takeout = Takeaway.new
# takeout.view_menu
# menu.print_menu

#
# 2.5.0 :001 > require './lib/takeaway.rb'
#  => true
# 2.5.0 :002 > takeaway = Takeaway.new
#  => #<Takeaway:0x00007f98e5134018 @dishes={"Pepperoni"=>7.5, "Hawaiian"=>6.5, "vegetarian"=>5.5}, @order={}>
# 2.5.0 :003 > takeaway.add_to_order("Pepperoni", 2)
#  => 2
# 2.5.0 :004 > takeaway.total
#  => 15.0
# 2.5.0 :005 > takeaway.place_order
#  => "Thank you! Your order was placed and will be delivered before 18:52"
# 2.5.0 :006 >
