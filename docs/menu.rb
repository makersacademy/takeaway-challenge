class Menu  

    attr_reader :order

    def initialize
       @list = { 'Latte' => 2.90, 'Cappuccino' => 2.80, 'Cake' => 3.50, 'Sandwich' => 4.00 }    

       @order = []
    end  

    def list_menu   
        @list.each do |key, value|
            puts "Item #{key} Cost #{value}"
        end
    end  

    def select_item(item, num) 
        if num >= 1 || num == nil
            @order << { item => num }   
            puts "#{num}x #{item} have been added to your basket."   
        else 
            puts "Plaese input a number of items."
        end 
    end  

    def check_total_order  
        @order
    end 
end  

menu = Menu.new 

menu.list_menu  

menu.select_item('Latte', 2)
