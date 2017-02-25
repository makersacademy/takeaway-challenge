require_relative '../../lib/orderconsole'

puts "----- FEATURE TEST -----"

orderconsole = OrderConsole.new

orderconsole.show_menu


# user inputs:
# order: Chicken x2, Veg x1
# expected total: 13


# menu.each { |k, v| puts "#{k} - £#{v}" }


puts "----- END FEATURE TEST -----"
