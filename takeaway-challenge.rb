require './lib/dish'
require './lib/menu'
require './lib/menufactory'
require './lib/orderfactory'
require './lib/order'
require './lib/invoice'
require './twilio'



menus = {
  :meatliquor => [{:name=>:nigiri_sushi, :price=>13.99},
                  {:name=>:tonkotsu_ramen, :price=>9.95},
                  {:name=>:teriyaki_salmon, :price=>8.80}],
  :nobu => [{:name=>:dead_hippy, :price=>8.99},
              {:name=>:black_palace, :price=>9.95},
              {:name=>:buffalo_chicken, :price=>8.80},
              {:name=>:cheese_fries, :price=>5.50}]
}

list1 = [{:name=>:nigiri_sushi, :price=>13.99},
              {:name=>:tonkotsu_ramen, :price=>9.95},
              {:name=>:teriyaki_salmon, :price=>8.80}]

list2 = [{:name=>:dead_hippy, :price=>8.99},
              {:name=>:black_palace, :price=>9.95},
              {:name=>:buffalo_chicken, :price=>8.80},
              {:name=>:cheese_fries, :price=>5.50}]
nobu_menu = MenuFactory.build(list1)
meatliquor_menu = MenuFactory.build(list2)

order = OrderFactory.load(meatliquor_menu)
order.choose_item(:dead_hippy,2)
order.choose_item(:cheese_fries)
order.confirm_order
order.place_order(ENV['PNUM'])


