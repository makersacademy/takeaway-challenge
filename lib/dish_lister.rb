module DishLister

  def print_money(sum)
    "£" + format('%<sum>.2f', sum: sum)
  end

  def add_dishes(*args)
    @dishes += args
    @dishes.flatten!
  end

  def list_dishes
    @dishes.map do |dish|
      "#{dish.name}, " + print_money(dish.price)
    end.join("\n")
  end

end
