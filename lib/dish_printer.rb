module DishPrinter

  def niceprint(dish)
    puts "#{dish.name.ljust(30)} 💎  #{dish.cost.to_s}"
  end
end