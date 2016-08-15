class Order

  attr_reader :menu, :order, :order_total, :order_cost, :grouped_dishes, :dish_count

  MENU = Menu::MENU

  def initialize(menu_klass = Menu, order_total_klass = OrderTotal)
    @menu = menu_klass.new
    @order_total = order_total_klass.new
    @order = []
  end

  def show_menu
    self.menu.give
  end

  def take(*order_numbers)
    order_numbers.each {|number|
      raise "That item is not on the Menu!" if MENU[number] == nil
      self.order << MENU[number]
    }
    show_order
  end

  def add_cost_to_order
    sort_order
    get_cost(order)
    add_total
  end

  private

  def get_cost(order)
    @order_cost = self.order_total.cost(order)
  end

  def sort_order
    group_dishes
    count_dishes
    clear_current_order_format
    add_new_order_format(self.dish_count)
  end

  def group_dishes
    @grouped_dishes = self.order.group_by {|dish| dish}
  end

  def count_dishes
    @dish_count = self.grouped_dishes.map{|dish, quantity| [dish, quantity.count] }
  end

  def clear_current_order_format
    self.order.clear
  end

  def add_new_order_format(dish_count)
    self.order << dish_count.to_h
  end

  def add_total
    self.order << {'Total' => self.order_cost}
  end

  def show_order
    self.order
  end

end
