class Menu

  attr_reader :menu

  def initialize
    @menu = [{dish: "cianfrusaglie alla rinfusa", price: 3}, {dish: "raudi accesi", price: 3}, {dish: "fragole alla carbonara", price: 14}]
  end

  def entry(dish = Dish.new)
    @menu << {dish: dish.name, price: dish.price}
  end
end
