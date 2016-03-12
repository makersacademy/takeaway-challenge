require_relative 'order'
require_relative 'menu'

order1 = Order.new
p order1.place_order({name: 'sushi', amout: 4},{name: 'soup', amout: 3}, 28)

p order1.basket
puts order1.show_menu

p menu = Menu.new
p menu.show_menu
p Menu::MENU


# MENU = [
#         {name: 'sushi', price: 12},
#         {name: 'ramen', price: 7},
#         {name: 'soup', price: 4.5},
#         {name: 'fish and chips', price: 10},
#         {name: 'bread', price: 3},
#         {name: 'olives', price: 1.5}
#         ]

# extract correct dish on the menu given a name of the dish
# p MENU.select {|item| (item[:name] == 'soup') || (item[:name] == 'bread') }

# 2.2.3 :001 > def testin(*dishes, total)
# 2.2.3 :002?>   puts dishes
# 2.2.3 :003?>   puts total
# 2.2.3 :004?>   end
#  => :testin
# 2.2.3 :005 > testin({name: 'sushi', amout: 4}, 28)
# {:name=>"sushi", :amout=>4}
# 28
#  => nil
# 2.2.3 :006 > testin({name: 'sushi', amout: 4},{name: 'soup', amout: 3}, 28)
# {:name=>"sushi", :amout=>4}
# {:name=>"soup", :amout=>3}
# 28
#  => nil
# 2.2.3 :007 > testin({name: 'sushi', amout: 4},{name: 'soup', amout: 3},{name: 'bread', price: 3}, 28)
# {:name=>"sushi", :amout=>4}
# {:name=>"soup", :amout=>3}
# {:name=>"bread", :price=>3}
# 28
#  => nil
