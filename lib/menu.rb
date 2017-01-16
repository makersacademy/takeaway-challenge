require './lib/menuhash'
require './lib/items_selection'
class Menu
 header = ' '

  def initialize
    menuhash = Foodbuddy.new
    header =  "Comfortingly good for you - FoodBuddy weekday menu"
    puts header
    puts "--------------------------------------------------"
    puts (menuhash.list).each{|key, value| puts "#{key} @ £ #{value.round(2)}"}
  end
end
