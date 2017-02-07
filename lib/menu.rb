require './lib/menuhash'

class Menu
 header = ' '

  def initialize
    menuhash = Foodbuddy.new
    header =  "Comfortingly good for you - FoodBuddy weekday menu"
    puts header
    puts "--------------------------------------------------"
    puts (menuhash.list).each{|key, value| puts "#{key} @ £ #{value.round(2)}"}
  end

  # items_selection - creates @items << {id: id, q: q}
  # order
  # for test purposes just add items to order via
  # order uses menuhash - map @items to @id map @items(id:, q:) to @id desc via id  = index
  #  to order[]
  #  order.calculate_total
  # set it out order.create_order - iterate and output desc plus total
  # send sms
  # twilio_test




end
