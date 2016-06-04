# how I want my interface to interact

require 'Takeaway'


hox = Takeaway.new

#hox.menu 
# => shows a list of items and prices, maybe should be able to order by id as well?
# do an interface that says 'and then' until you say "THAT'S ALL THANKS"

# hox.menu[0][:id] (shows the id of first value, could iterate for each index, check value...)
# hox.menu.each {|x| puts x[:name] if x[:id] == 1 } could map to an array of prices to total up


# hox.order(1,"Pilau Rice", 2,"Naan", 1, "Lamb Bhuna")

# quantity and item, or maybe quantity and item ID. 
# should print back a readable list, e.g. 2x Naan, 1x Lamb Bhuna

#hox.bill 
# => should show the items selected
# => checks the total is correct (throws error if not) 
# shows itemised basket with a total and a list of the additions of items,
# asks to verify order (gets.chomp?)

#hox.place_order 
# => places order, sends a text if successfull

