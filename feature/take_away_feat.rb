require_relative '../lib/take_away_menu.rb'

take_away = TakeAway.new
p take_away.print_menu
take_away.add_item_to_order("frog", 3)
take_away.add_item_to_order("lamb", 2)
p take_away.check_order
take_away.checkout(7)
