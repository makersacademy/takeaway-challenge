class Menu
attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end
  
  def see_dishes
     @dishes.each_with_index do |(key, value), index|
     "#{index+1}, #{key.to_s.capitalize}, #{value}\n"
     end
  end

  def dish_available?(dish)
    dishes.include?(dish)
  end

   def print_menu
     dishes.map do |title, price|
     "%s £%.2f" % [title.to_s.capitalize, price]
     end.join(", ")
    end
  
end
 



