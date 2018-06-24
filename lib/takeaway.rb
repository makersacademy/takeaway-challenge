require './lib/menu'
require './lib/send_sms'

class Takeaway

  attr_reader :menu, :order, :time

  def initialize(menu = Menu, sms = Send_message)
    @menu_class = menu.new
    @menu = @menu_class.menu
    @order = []
    @message = sms.new
    @time = Time.new + 3600
  end

  def show_menu
    @menu
  end

  def add_item(item)
    # pass key to array
    if @menu.include? item
      @order << item
    else p "Item not available."
    end
  end

  def calculate_sum
    # calculate sums of all key values
    sum = 0
    @order.each {|x| sum += @menu[x]}
    sum
  end

  def place_order # place order
    @message.send(@time)
  end

end
