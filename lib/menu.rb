
class Menu

  def initialize(dishes =[{ :dish => "Chicken Korma", :price => 8 }, { :dish => "Lamb Balti", :price => 9 }])
    @dishes = dishes
  end

  def show_dishes
    @dishes.each_with_index { |menu_item, index| puts "#{index + 1}. #{menu_item[:dish]} £#{menu_item[:price]}" }
  end

  def return_dish_from_number(dish_no)
    @dishes[dish_no - 1][:dish]
  end

  def return_unit_cost_from_number(dish_no)
    @dishes[dish_no - 1][:price]
  end

end
