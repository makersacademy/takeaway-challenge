module DishPrinter
  def self.to_string(dish, index)
    name = dish.name
    description = dish.description
    price = dish.price
    "#{index}. #{name}   #{description}      #{price}"
  end

  def self.to_summary(dish, index)
    name = dish.name
    price = dish.price
    "#{index}. #{name}      #{price}"
  end
end
