require './lib/menu'
require './lib/order'

class Takeaway
attr_accessor :order, :arr

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def view_menu
    p @menu
  end

  def place_order
    p prompt
    orderloop
    confirm_order
  end

  def prompt
    "Please input your order. End by pressing Enter twice."
  end

  def orderloop
    order = gets.chomp
    while order != ''
      input_order(order)
      order = gets.chomp
    end
  end

  def input_order(order)
    order = order.split(', ')
    number = order[1].to_i
    return "Not in menu. Please try again." unless @menu.contains(order[0])
    @order.add(order[0], number)
  end

  def confirm_order
    p 'Thanks. Printing order for review:'
    @menu.menu.delete_if {|key, value| !@order.list.key?(key)}
    @menu.menu.each_pair {|key, value| puts "#{key}: #{value * @order.list(key)}"}
    confirmed ? send_confirm_text : "Cancelled."
  end

  def confirmed
    p "Press Enter to confirm, or any other key + Enter to cancel."
    @confirmed = true if gets.chomp == ''
  end

  def send_confirm_text
    p "Confirmed."
  end

end
