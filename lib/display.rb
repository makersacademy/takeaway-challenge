require_relative 'restaurant'

class Display

  def menu(restaurant)
    @menu_array = []
    restaurant.dishes.each do |dish|
      @menu_array << "#{@menu_array.count + 1}. #{dish.name} (£#{dish.price})"
    end
    @menu_array.join("\n")

  end
end
