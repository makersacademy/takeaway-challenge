require_relative "menu"
require_relative "order"
require_relative "sms"

class Takeaway

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
  # Allows us to inject an order object on initialization OR (||) by default
  # assign @order a new Order object.
    @sms = sms || SMS.new(config)
  # Allows us to inject a SMS object on initialization OR (||) by default
  # assign @sms a new SMS object.
  end

  def print_menu
    menu.print
  # Calls the instance method "print" from the Menu class on the value of the
  # menu variable.
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  # Calls the instance method "total" from the Order class on the value of
  # the order variable.
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each { |dish, quantity |
      order.add(dish, quantity)
    }
  end

end
