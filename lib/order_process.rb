class OrderProcess

  attr_reader :order

  def initialize
    @order = []
  end

  def new_order
    dishes = DishSelection.new
    dishes.print_options_menu
    add_dishes_to_order
  end

  def add_dishes_to_order
    @order = dishes.order
  end


end
