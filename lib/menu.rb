class Menu
  
  def dishes
    {:Fries => 2,
     :Pizza => 4,
     :Burger => 3,
     :Cola => 1}
  end

  def print_menu
    dishes.each_with_index do | (item, price), index |
      puts "#{index + 1}: #{item} | Cost: £#{price}"  
    end
  end
end


  ##ef available?(item)
      #"This item is available to order!" if dishes.include? item.capitalize
 #end
#end

  