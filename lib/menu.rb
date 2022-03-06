class Menu

  def initialize
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def delete(dish_number)
    fail "Please enter the dish number" unless dish_number.is_a? Integer
    fail "This dish does not exist" unless @menu[dish_number - 1] && dish_number -1 >= 0
    @menu.delete_at(dish_number - 1)
  end

  def display
    fail "No menu available" if @menu.empty?
    @menu.each_with_index do |dish, i|
      puts "#{i + 1}. #{dish.name} - £%0.2f" % [dish.price]
    end
  end

end