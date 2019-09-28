module DishPrinter

  def niceprint(dish)
    "#{dish.name.ljust(30)} 💎  #{dish.cost}"
  end
  
end
