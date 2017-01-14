require './lib/menuhash'
class Menu

  def initialize
    menuhash = Foodbuddy.new
    puts "Comfortingly good for you - FoodBuddy weekday menu"
    puts "--------------------------------------------------"
    puts (menuhash.list).each{|key, value| puts "#{key} @ £ #{value.round(2)}"}
    puts "Press return when ready to enter order"
  end
end
#create formatting / title and ordering info etc
