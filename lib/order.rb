
class Order

attr_reader :myorder
  def initialize
    @menu = { "Chicken" => 5, "Lamb" => 8, "Chips" => 2 }
    @myorder = {}
  end

  def show_menu
    @menu
  end

  def order_food (dish, quantity, total)
    if @menu.has_key?("#{dish}") then myorder.store("#{dish}",quantity)
    else
     raise "Sorry, that is not a dish on the menu" if !@menu.has_key?("#{dish}")
    end
  end

  def check_total

  end

end
