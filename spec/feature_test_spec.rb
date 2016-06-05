require 'restaurant'

lazana_menu = Menu.new

lazana_menu.add_to_menu(:chicken_korma, 4.50)
lazana_menu.add_to_menu(:lamb_madras, 5.00)
lazana_menu.add_to_menu(:prawn_jalfrezi, 6.00)
lazana_menu.add_to_menu(:keema_naan, 2.00)
lazana_menu.add_to_menu(:poppadum, 0.50)
lazana_menu.add_to_menu(:dodgy_omlette,3.00)


lazana = Restaurant.new(lazana_menu)

lazana.show_menu

lazana.order_item("chicken_korma",2)
lazana.order_item("lamb_madras", 2)
lazana.order_item("keema_naan", 6)
lazana.order_item("poppadum", 10)

p lazana.see_basket

lazana.complete_order