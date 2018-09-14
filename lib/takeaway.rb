#require 'menu'
class Takeaway

attr_reader :customer_order
@menu = []

  def initialize(menu = Menu.new)
    @customer_order = []
    @menu = menu
  end

  def show_menu
    @menu.show_menu
  end

  def ready_to_order
    @customer_order = @menu.select_dishes
  #  verify_order(@customer_order)
  end

  # def verify_order(order)
  #
  # end
  # def order(selected_dishes_with_quantity)
  #   @ordered_dishes = {}
  #   @ordered_dishes[:dish] = dish
  #   @ordered_dishes[:quantity] = quantity
  #   @customer_order.push(@ordered_dishes)
  # end

  end
