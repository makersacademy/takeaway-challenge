class Menu

  def initialize
   @menu_list = {noodles: 3, rice: 2, crackers: 1}
   @orderlist = []
   @total = []
  end

  def menu_list
    @menu_list.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

  def order
    puts "what dish would you like ? "
    dish = gets.chomp
    puts " what quantity of #{dish} would you like"
    number = gets.chomp
  end

  def select_dish(dish, number)
    case dish
      when "noodles"
        puts "noodles * #{number}" 
        number.times do 
          @orderlist << dish
          @orderlist << @menu_list[:noodles]
        
        end
        @total << @menu_list[:noodles] * number

      when "rice"
        puts "rice * #{number}" 
        number.times do 
          @orderlist << dish
          @orderlist << @menu_list[:rice]
        
        end
        @total << @menu_list[:rice] * number
    end
  end

  def total 
    print @orderlist
    puts @total.sum
    end
end

menu = Menu.new
menu.menu_list
menu.order
menu.select_dish("noodles", 2)
menu.select_dish("rice", 3)
menu.select_dish("crackers", 1)
menu.total
