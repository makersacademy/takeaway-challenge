class CustomerSelection
    
  attr_reader :selection, :dish, :quantity, :continue, :menu
    
  def initialize(menu = Menu.new)
    @selection = {}
    @dish = nil
    @quantity = nil
    @continue = "Y"
    @menu = menu
  end  
    

  def select_dish
    puts "Please enter dish:"
    @dish = gets.chomp
  end
  
  def select_quantity
    puts "Please enter quantity:"
    @quantity = gets.chomp
  end
  
  def select_continue
    puts "Continue?"
    @continue = gets.chomp
  end
  
  # def place_order  
  #       select_dish
  #     select_quantity
  #       @selection[@dish] = @quantity
  #     select_continue
      
      
  #     select_dish
  #     select_quantity
  #     select_continue
  #     @selection[@dish] = @quantity
      
      
  #   # @dish = nil
  #     #@quantity = nil
  # end
  
  def place_order
    loop do
      select_dish
      select_quantity
      @selection[@dish] = @quantity
      #@dish = nil
      #@quantity = nil
      select_continue
      p @selection
      exit if @continue == "N"
    end
  end
  
  
  # def place_order
    
  #   2.times do
  #     select_dish
  #     select_quantity
  #     @selection[@dish] = @quantity
  #     #@dish = nil
  #     #@quantity = nil
  #     select_continue
  #     #p @continue
  #   end
  # end
  
  #   def place_order
  #   while_continue = "Y"
  #   while true do
  #     select_dish
  #     select_quantity
  #     @selection[@dish] = @quantity
  #     #@dish = nil
  #     #@quantity = nil
  #     select_continue
  #     while_continue = @continue
  #   end
  # end
  
  def print_order
    @selection
  end
  
end