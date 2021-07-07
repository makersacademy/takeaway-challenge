require_relative 'menu'

class Order

    attr_accessor :final_amount, :selected_items, :final_amount_to_sum, :standard_menu


    def initialize
        # @standard_menu = Menu.new
        #@standard_menu = { "chicken" => 6, "rice" => 4, "beef" => 6, "pizza" => 6, "fajita" => 6 }
        @standard_menu = Menu.new
        @final_amount_to_sum = []
        @selected_items = []
    
    end

    def in_the_menu?(item)
        @standard_menu.standard_menu.include?(item)
    end
   
    def select_items(item,number)
        raise 'The selected item does not exist' unless in_the_menu?(item)
            number.times { @selected_items.push(item) }
            "You have chosen #{number},#{item}"
    end

    def sum_items
      @selected_items.each do |item|
        @final_amount_to_sum.push(Menu.new.standard_menu[item])
      end
        @final_amount_to_sum.sum 
    end

    def final_order_check
      @selected_items.each do |item|
        puts "You have ordered 1.#{item}"
      end
      "You will be charged #{sum_items} pounds"
    end
end
