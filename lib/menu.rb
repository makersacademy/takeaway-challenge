class Menu
  def view
    "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
  end

  def provide_dish(dish_number)
    Pie.new
  end
end