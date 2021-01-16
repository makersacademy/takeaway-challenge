class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "onion bhaji" => 2.95, "vegetable samosa" => 2.95, "aloo pakora" => 2.95,
                "chicken tikka" => 3.95, "mixed kebab" => 4.95 }
  end
end


class Takeaway
  attr_reader :dishes
  attr_accessor :basket
  def initialize
    @dishes = Menu.new.dishes
    @basket = {}
    @total = 0
  end

  def read_menu
    @dishes
  end

  def order(dish, quantity = 1)
    if @basket.include?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
    "#{dish}, x#{quantity}"
  end

  def total
    @basket.map do |_menu_item, price|
      t@otal += price
    end
    total
  end
end
