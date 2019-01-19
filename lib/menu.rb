class Menu

attr_reader :dish

DEFAULT_MENU = { margherita: 8, romana: 10, four_cheese: 12, seafood: 14, garlic_bread: 5 }

def initialize (dish=DEFAULT_MENU.sort)
  @dish = dish
end

def print_menu
  display = @dish.each{ |key, value|
  puts "#{key} £#{value}"}  # tested in Repl
end

end


#takeaway = Menu.new
#takeaway.display_menu


#takeaway.order(pizza)

#=> adds 7 to bill

#order.displaybill
#7

#order.confirm
#sends text message
#deletes instance of order1
