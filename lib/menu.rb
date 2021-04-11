class Menu 
  attr_reader :dishes_list
  def initialize
    @dishes_list = []
      
  end 

  def add_dish(dish)
    @dishes_list << dish
  end

  def print_menu
    @dishes_list.each do |dish|

      print "Name: #{dish.name} - Price: £#{dish.price}\n"
    end
    return
  end

end
