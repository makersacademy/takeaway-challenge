
require_relative 'text.rb'
require_relative 'menu.rb'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, messager = Text.new)
    @menu = menu
    @messager = messager
    @order = {}
  end

  def display_menu
    @menu.list
  end

  def add_item(item, quantity=1)
    fail 'No such item on the menu' unless @menu.list.include?(item)
    @order[item] = quantity
    summary
  end

  def remove_item(item)
    fail 'No such item in your order' unless @order.include?(item)
    @order.tap { |items| items.delete(item) }
    summary
  end

  def order_summary
    summary
  end

  def order_total
    "Order Total: £#{order_calc}"
  end

  def place_order(payment)
    fail 'Wrong payment amount' unless payment == order_calc.to_f
    @messager.send_message(confirmation_message)
  end

  private

  def summary
    @order.map do |item, quantity|
      "#{quantity} x #{item} = £#{'%.2f' % (@menu.list[item] * quantity)}"
    end.join(', ')
  end

  def order_calc
    result = @order.map { |item, quantity| @menu.list[item] * quantity }.inject(:+)
    '%.2f' % result
  end

  def one_hour
    t = Time.new + 3600
    t.strftime("%H:%M")
  end

  def confirmation_message
    "Thanks for your order, which cost £#{order_calc}. Your food should be with you by #{one_hour}."
  end

end
