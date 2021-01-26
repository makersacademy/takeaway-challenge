class BillCalculator
  attr_accessor :total, :order
  attr_writer :meal_options

    def initialize(meal_options)
      @meal_options = meal_options
      @total = 0
      @order = []
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

    def store_order(dishes)
      dishes.each do |chosen_dish, quantity|
        menu_item = @meal_options.keys
        price =  @meal_options
        if chosen_dish == menu_item[0]
          @order << "#{chosen_dish} (£#{price[:Hamburger]}) x #{quantity} = £#{quantity*price[:Hamburger]}"
        elsif chosen_dish == menu_item[1]
          @order << "#{chosen_dish} (£#{price[:Pizza]}) x #{quantity} = £#{quantity*price[:Pizza]}"
        elsif chosen_dish == menu_item[2]
          @order << "#{chosen_dish} (£#{price[:Pasta]}) x #{quantity} = £#{quantity*price[:Pasta]}"
        elsif chosen_dish == menu_item[3]
          @order << "#{chosen_dish} (£#{price[:Fish_and_chips]}) x #{quantity} = £#{quantity*price[:Fish_and_chips]}"
        elsif chosen_dish == menu_item[4]
          @order << "#{chosen_dish} (£#{price[:Salad]}) x #{quantity} = £#{quantity*price[:Salad]}"
        elsif chosen_dish == menu_item[5]
          @order << "#{chosen_dish} (£#{price[:Lamb_Shank]}) x #{quantity} = £#{quantity*price[:Lamb_Shank]}"
        end
      end
   end

end
