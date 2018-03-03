class DishPrinter

  def print(dish_array)
    out_string = ""
    dish_array.each_with_index do |dish, i|
      out_string += "#{i + 1}. #{dish.print}\n"
    end
    out_string
  end

end
