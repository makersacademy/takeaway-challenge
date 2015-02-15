class Takeaway

  attr_reader :menu, :dishes_selected, :total_price

  def initialize
    @menu = Hash.new
    @dishes_selected = []
  end

  def menu_update(dish)
    menu['dish'] = dish.price.to_s + '£'
  end 

  def quantity
    dish.quantity
  end

  def order
    puts self.menu
    puts "To begin the selection, press enter. To cancel the action, type 'exit'."
    while gets.chomp != 'exit'
      puts "Please choose a dish."
      dish = gets.chomp
      dishes_selected << dish
      puts "Please select the quantity of the dish."
      quantity = gets.chomp
      puts "Please press enter to select another dish or type 'exit'."
    end
    puts "Here is your order."
    puts dishes_selected
    total_price_calculator(dish, quantity)
  end

  def total_price_calculator(dish, quantity)
    price = menu['dish']
    @total_price = price.to_i * quantity.to_i
    raise 'Total price not correct' if @total_price != price.to_i * quantity.to_i
    puts total_price.to_s + '£'
  end
end