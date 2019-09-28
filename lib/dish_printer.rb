module DishPrinter

  def niceprint(dish)
    "#{dish.name.ljust(30)} 💎  #{dish.cost.to_s}"
  end
end