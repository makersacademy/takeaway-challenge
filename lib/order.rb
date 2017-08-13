require_relative "./menu.rb"

class Order

  attr_reader :order_list, :menu

  def initialize
    @menu = Menu.new
    @order_list = {}
  end

  def show_menu
    @menu.show_menu
  end

  def add_order(item, quantity = 1)
    raise "Can not select a quantity of 0" if quantity.zero?
    # order_list[item] = "#{quantity * menu.dishes[item]}".to_f
    order_list[item] = [quantity, "#{order_price(item, quantity)}".to_f]
    "You have ordered #{item} - x #{quantity}"
    # "#{item} - x #{quantity} = £ #{quantity * @menu[item]}"
  end

  def order_price(item, quantity)
    "#{quantity * menu.dishes[item]}".to_f
  end

  def show_basket
    order_list.each do |k, v|
      puts "#{k} x#{v[0]} = £#{v[1]}"
    end
  end

  def individual_dish_costs
    order_list.values.map { |x| x[-1] }
  end

  def order_total
    individual_dish_costs.reduce(0, :+)
  end

  def item_quantity(item)
    order_list[item][0]
  end

  def remove_selection(item)
    order_list.delete(item)
  end

  def edit_selection(item, quantity)
    add_order(item, quantity)
  end

end
