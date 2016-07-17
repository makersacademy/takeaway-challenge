require_relative 'menu'

class Takeaway

  attr_reader :selection

  def initialize
    @menu = Menu.new
    @selection = {}
  end

  def select_item(item, quantity)
    @selection[item] = quantity
  end

  def calculate_total
    sum = 0
    selection.each_pair { |item, quantity| sum += (list_menu[item].to_f * quantity)}
    sum
  end

  def confirm_order(value)
    message = "Order not confirmed, please check your total and try again."
    raise message if calculate_total != value
    "confirmed"
  end

  def list_menu
    @menu.display_menu
  end
end
