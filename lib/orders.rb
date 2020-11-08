class Order
  attr_reader :orders_list, :menu_instance

  def initialize(menu_instance)
    @orders_list = []
    @menu_instance = menu_instance
  end

  def take_order(number)
    raise "The number you chose it's not associated to any dish" unless number > 0 && number <= @menu_instance.dishes.length
    @orders_list << number
  end
end
