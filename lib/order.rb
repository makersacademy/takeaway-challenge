require_relative 'menu'
require_relative 'text'
class Order
    
    attr_reader :chosen_items, :menu_klass, :final_bill, :text_klass
    
    def initialize(menu_klass = Menu.new, text_klass = Text.new)
        @menu_klass = menu_klass
        @text_klass = text_klass
        @chosen_items = Hash.new(0)
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
    
    def finalize_order
        @text_klass.send_message(confirmation_text)
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
    
    def delivery_time
        time = (Time.new + 3600).strftime("%H:%M")
    end

    
    def confirmation_text
         "Thank you for placing your order!  Your order will arrive at #{delivery_time} and will be a total of #{show_bill
         }."
    end
end