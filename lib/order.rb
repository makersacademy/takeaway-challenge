require 'menu'

  class Order 

  attr_reader :order, :menu

      def initialize
        @order = []
        @menu = menu
      end

     # def add(dish_number)
      #  order = Order.new
     #   order = ['']
      #  menu[0].push(order)
     # end


      def select_dish(dish_number)
        @menu.each do |dish_number|
          if menu[:dish_number] == dish_number
            @order << dish_name
          end
        end
      end
  end
    
    

