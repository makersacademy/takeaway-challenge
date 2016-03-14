require_relative 'order'
require_relative 'checkout'

class TakeAway
  attr_reader :menu, :selection, :order_class, :current_order, :checkout_class

  NOT_IN_MENU = "Item not in menu"
  DEFAULT_QUANTITY = 1
  INCORRECT_PAYMENT = "Incorrect payment amount"
  MENU = {"fish and chips" => 4.34,
          "chicken korma" => 3.56,
          "sausages and mash" => 5.46,
          "cheese pizza" => 2.87,
          "pepperoni pizza" => 3.93}

  def initialize(order_class, checkout_class)
    @order_class = order_class
    @checkout_class = checkout_class
    @current_order = nil
    @selection = {}
    @menu = MENU
  end

  def display_menu
    MENU.each { |dish, price| puts "dish: #{dish} price: #{price}" }
  end

  def order(item, quantity=DEFAULT_QUANTITY)
    in_order
    raise NOT_IN_MENU unless include_item?(item)
    select_item(item, quantity)
    @current_order.add_to_basket(@selection)
    reset_selection
  end

  def checkout(payment)
    raise INCORRECT_PAYMENT if incorrect_amount?(payment)
    create_checkout
    @checkout_class.send_sms
    close_order
    confirmation
  end

  private

  def include_item?(item)
    menu.include? item
  end

  def select_item(item, quantity)
    @selection[item] = quantity
  end

  def in_order
    @current_order ||= @order_class.new
  end

  def create_checkout
    @checkout_class = checkout_class.new(Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end

  def reset_selection
    @selection.clear
  end

  def close_order
    @current_order = nil
  end

  def incorrect_amount?(payment)
    payment != @current_order.total
  end

  def confirmation
    return "Confirmation message sent"
  end
end
