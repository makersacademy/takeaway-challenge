require_relative 'menu'
require_relative 'order'
require_relative 'messager'


class Takeaway

  attr_reader :menu, :current_order
  def initialize(menu = Menu.new, current_order = nil, messager = Messager.new)
    @menu = menu
    @current_order = current_order
    @messager = messager
  end

  def show_menu
    @menu.print_menu
  end

  def order(item, quantity = 1)
    @menu.contains?(item)
    order_helper(item, quantity)
    "#{quantity}x #{item}(s) added to your order."
  end

  def order_summary
    @current_order.summary
  end

  def total
    "Your total is: $#{@current_order.total}"
  end

  def complete_order(total)
    incorrect_total_error unless correct_total?(total)
    @messager.send_text(total)
    confirmation_message(total)
  end


  private

  def order_helper(item, quantity)
    @current_order = Order.new if @current_order.nil?
    @current_order.add(item, @menu.dishes[item], quantity)
  end

  def correct_total?(total)
    @current_order.total == total
  end

  def incorrect_total_error
    raise "That total is not correct!"
  end

  def confirmation_message(total)
    "Thank you! Your total is $#{total} and a confirmation text is on it's way!"
  end

end
