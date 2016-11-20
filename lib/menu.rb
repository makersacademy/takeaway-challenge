
class Menu

attr_accessor :list_of_dishes

  def initialize
    @list_of_dishes = { "margherita" => 9, "pepperoni" => 10, "americano" => 11 }
  end

  def order(item, quantity)
    @current_order.order(item, quantity, 9)
  end



end
