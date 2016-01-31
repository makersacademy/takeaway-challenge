require_relative 'menu'
class Order
    
    attr_reader :chosen_items, :menu_klass, :final_bill
    
    def initialize(menu_klass = Menu.new)
        @menu_klass = menu_klass
        @chosen_items = Hash.new
        @final_bill = 0
        @number_of_dishes = 0
    end
    
    def order_selection(item, quantity)
        if @menu_klass.view_menu.include?(item) 
            chosen_items[item] = quantity
        else
            raise "please select an item from the menu"
        end
    end
    
    def check_order
        @chosen_items
    end
    
    def order_summary
        order_summary_calc
    end
    
    def total_dishes
        count_dishes
    end
    
    def show_menu
        @menu_klass.view_menu
    end
    
    def show_bill
        "£#{calculate_bill}"
    end
    
    def confirmation_text
    end
    
    private
    
    def count_dishes
        @number_of_dishes = 0
        @chosen_items.each_value do |quantity|
            @number_of_dishes += quantity
        end
        @number_of_dishes
    end
    
    def order_summary_calc
        #make this nicer
        @chosen_items.map do |item, quantity|
          "#{item} x #{quantity} = £#{@menu_klass.view_menu[item] * quantity}0"
        end.join(", ")
    end
    
    def calculate_bill
        @chosen_items.each do |item, price|
           @final_bill += menu_klass.view_menu[item] * price 
        end
        "%.2f" % @final_bill
    end
    
end