class MenuError < StandardError
end

class Menu

  def initialize
    @list_of_dishes = [{ name: "Arepa", price: 7.00 },{ name: "Yuca", price: 5.00 }]
  end

  def print_menu_dishes
    @list_of_dishes.each do |dish|
      puts "#{dish[:name]}  £#{dish[:price]}"
    end
  end

  def menu_checker(dish_name)
    raise MenuError, "Dish not found in menu" if list_of_dishes.select {|dish| dish[:name] == dish_name.capitalize }.empty?
  end

  def get_name(dish_name)
    menu_checker(dish_name)
    list_of_dishes.select { |dish| dish[:name] == dish_name.capitalize}[0][:name]
  end

  def get_price(dish_name)
    menu_checker(dish_name)
    list_of_dishes.select {|dish| dish[:name] == dish_name.capitalize }[0][:price]
  end



  private
  attr_reader :list_of_dishes

end
