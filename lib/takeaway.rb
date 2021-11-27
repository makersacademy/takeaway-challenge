class Takeaway

attr_reader :menu
    def initialize
      @menu = {
        "Eggs Benedict": 8.50, 
         "Full English": 9, 
         "Waffles": 6
        }
    end 

    def print_menu
      @menu.each do |item, price|
      puts "#{item}: £#{price}" 
      end 
    end
end 