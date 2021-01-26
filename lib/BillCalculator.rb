class BillCalculator
  attr_accessor :total, :order
  attr_writer :meal_options

    def initialize(meal_options)
      @meal_options = meal_options
      @total = 0
      @order = []
    end

    def store_order(dishes)
      dishes.each do |chosen_dish, quantity|
        menu_item = @meal_options.keys
        price =  @meal_options
          @order << compile_order(chosen_dish, price[:Hamburger], quantity) if chosen_dish == menu_item[0]
          @order << compile_order(chosen_dish, price[:Pizza], quantity) if chosen_dish == menu_item[1]
          @order << compile_order(chosen_dish, price[:Pasta], quantity) if chosen_dish == menu_item[2]
          @order << compile_order(chosen_dish, price[:Fish_and_chips], quantity) if chosen_dish == menu_item[3]
          @order << compile_order(chosen_dish, price[:Salad], quantity) if chosen_dish == menu_item[4]
          @order << compile_order(chosen_dish, price[:Lamb_Shank], quantity) if chosen_dish == menu_item[5]
      end
    end

    def calculate_total(dishes)
      dishes.each do |chosen_dish, quantity|
        menu_item = @meal_options.keys
        price =  @meal_options
          (@total += (quantity * price[:Hamburger])) if chosen_dish == menu_item[0]
          (@total += (quantity * price[:Pizza])) if chosen_dish == menu_item[1]
          (@total += (quantity * price[:Pasta])) if chosen_dish == menu_item[2]
          (@total += (quantity * price[:Fish_and_chips])) if chosen_dish == menu_item[3]
          (@total += (quantity * price[:Salad])) if chosen_dish == menu_item[4]
          (@total += (quantity * price[:Lamb_Shank])) if chosen_dish == menu_item[5]
      end
    end

    def compile_order(dish, price, quantity)
      return "#{dish} (£#{price}) x #{quantity} = £#{quantity*price}"
    end

end
