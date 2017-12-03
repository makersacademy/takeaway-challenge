require_relative 'menu'

class Order
  attr_reader :basket, :dish, :quantity, :current_value

    def initialize
      @menu = Menu.new
      @basket = {}
      @dish = dish
      @quantity = quantity
      @current_value = current_value
    end

    def add_dish
      puts "Hi, please enter the name of the dish you want to add."
      @dish = gets.chomp.to_sym
      fail "This dish is not on the menu" unless dish_available?
      puts "Please enter the quantity of the dish."
      @quantity = gets.chomp.to_i
      ordered_dishes
    end

    def remove_dish
      puts "Hi, please enter the name of the dish you want to remove."
      @dish = gets.chomp.to_sym
      raise "This dish is not in the basket." if not_in_basket?(dish)
      deleted_dish(@dish)
    end

    def ordered_dishes
      @basket[@dish] = @quantity, @menu.menu[@dish].to_f
    end

    def deleted_dish(dish)
      @basket.delete(@dish)
    end

    def order_total
      @current_value = calculate(@basket)
    end

    def calculate(basket)
      @basket.values.map {|each_order| each_order.inject(:*)}.map.inject(:+)
    end


  private

    def dish_available?
      @menu.menu.has_key?(@dish)
    end

    def not_in_basket?(dish)
      @basket[@dish].nil?
    end

end
