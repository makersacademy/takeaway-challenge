require_relative './dish.rb'
require_relative './menu.rb'

class Order 

  attr_writer :selections
  attr_reader :selections, :total_order_value, :total_dishes

    def initialize
      @selections = []
      @total_dishes = 0
      @total_order_value = 0
    end

    def add_selection(menu, dish, quantity)
      check_dish_exists(menu, dish) # not working, see method below
      selection = {:dish => dish.name, :quantity => quantity, :price => dish.price}
      @selections << selection
    end

    def check_selections
      @selections.each do |selection|
        puts "Dish: #{selection[:dish]} - Quantity: #{selection[:quantity]}"
      end
    end

    def check_total
      total = 0
      @selections.each do |selection|
      total += (selection[:quantity] * selection[:price])
      end
      puts "£#{total}"
    end

    def order_meal
      check_selections
      check_total
      send_confirmation
    end

  private

  attr_writer :selection

    def check_dish_exists(menu, dish)
      # raise "Dish does not exist" unless  menu.dishes.flatten!.include?(dish) == true
      # is broken, the flatten! function is returning a nil class, can't figure out why
    end

    def generate_time
      @time_now = Time.now
      @time_plus_one_hour = @time_now + 3600
    end

    def send_confirmation
      generate_time
      generate_confirmation_message
    end

    def generate_confirmation_message
      "Thank you! Your order was placed and will be delivered before #{@time_plus_one_hour}."
    end

end
