class Takeaway
  attr_reader :menu, :basket, :total

    def initialize
      @menu = {
        "Eggs Benedict" => 8.50, 
         "Full English" => 9, 
         "Waffles" => 6
        }
      @basket = []
      @total = 0
    end 

    def print_menu
      @menu.each do |item, price|
      puts "#{item}: £#{price}" 
      end 
    end

    def add_to_basket(dish)
       @basket << @menu.assoc(dish)
    end 

    def show_cost
      @basket.each do |item, price| 
      @total += price
      end 
      puts total
    end
end 