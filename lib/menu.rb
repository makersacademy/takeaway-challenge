require 'dishes'

class Menu
  include Dishes

  def view_dishes
    dish_list.each_with_index do |hsh, index|
      meal, price = hsh.keys[0], hsh.values[0]
      puts "#{index + 1}. #{meal}: #{price}"
    end
  end

end
