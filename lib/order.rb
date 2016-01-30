require_relative 'menu'

class Order 

  def show_menu
    tidy_menu
  end

  def choose(pizza)
  end

end

private

 def tidy_menu
  puts
  puts "PIZZA"
  puts
  puts MENU.map{ |k,v| (k + "  £" + v.to_s) }
  puts
  return  'Please choose from the above list'
 end
