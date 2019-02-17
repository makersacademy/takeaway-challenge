require "./lib/menu.rb"
require "./lib/order.rb"
require "./lib/total_checker.rb"

m = Menu.new
m.view

o = Order.new
o.select_dish("chips", 2)
o.select_dish("chicken chow mein")
o.select_dish("doner kebab", 4)
o.view_basket
o.total
o.total_checker

t = TotalChecker.new([{:dish=>"chips", :quantity=>2, :price=>2.0}, {:dish=>"chicken chow mein", :quantity=>1, :price=>2.8}, {:dish=>"doner kebab", :quantity=>4, :price=>12.8}], 17.60)
t.check

o.place_order

bundle exec ruby ./lib/send-sms.rb
