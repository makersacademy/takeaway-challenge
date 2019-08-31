class Takeaway

  attr_reader :menu

  CURRENT_MENU = {"burger" => "£2", "chips" => "£1", "kebab" => "3"}

  def initialize
    @menu = CURRENT_MENU
    @order = []
  end

  def order(dish, quantity)
    @order << [dish, quantity]
  end

end
