require './lib/take_away_menu.rb'

take_away = TakeAwayMenu.new
p take_away.menu
take_away.add_item_to_order("frog", 3)
take_away.add_item_to_order("lamb", 2)
p take_away.check_order
