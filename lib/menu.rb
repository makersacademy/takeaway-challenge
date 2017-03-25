class Menu

  attr_reader :mains, :desserts

  def initialize
    @mains = [{1 => "Lasagna", "price:" => "£10"}, {2 => "Burger", "price:" => "£5"}]
    @desserts = [{1 => "Icecream", "price:" => "£5"}, {2 => "Cake", "price:" => "£3"}]
  end

  def add_main(dish, price)
    mains << { (mains.length + 1) => dish, "price:" => "£#{price}" }
  end

  def add_dessert(dish, price)
    desserts << { (desserts.length + 1) => dish, "price:" => "£#{price}"}
  end 

end
