require_relative "./menu.rb"
require_relative "./app.rb"


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
    raise "That item is not on the menu" if !(menu.dishes.include?(item))
    raise "Can not select a quantity of 0" if quantity.zero?
    order_list[item] = [quantity, "#{order_price(item, quantity)}".to_f]
    "You have ordered #{item} - x #{quantity}"
  end

  def order_price(item, quantity)
    "#{quantity * menu.dishes[item]}".to_f
  end

  def show_basket
    order_list.each do |k, v|
      puts "#{k} x#{v[0]} = £#{v[1]}"
    end
    puts "Total: £#{order_total}"
  end

  def individual_selection_costs
    order_list.values.map { |x| x[-1] }
  end

  def order_total
    individual_selection_costs.reduce(0, :+)
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

  def order_correct?(price)
    order_total == price
  end

  def complete_order(price)
    if order_correct?(price)
      sms_message = Message.new(price)
      sms_message.send_sms
    else
      "The price does not match. Please review your order"
    end
  end

end
