class Takeaway

attr_reader :menu, :basket

    def initialize
      @menu = {
        "Eggs Benedict": 8.50, 
         "Full English": 9, 
         "Waffles": 6
        }
      @basket = []
    end 

    def print_menu
      @menu.each do |item, price|
      puts "#{item}: £#{price}" 
      end 
    end

    def add_to_basket(dish)
     basket << dish
    end 
end 