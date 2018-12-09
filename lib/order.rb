require_relative 'menu'
require_relative 'send_sms'

class Order

  attr_accessor :total

  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.print_menu
  end

  def select_items(selection)
    @total = @menu.total(selection)
  end

  def check_total
    raise "Incorrect order total" if @total != @menu.order_total
    p "Your order total is #{@total}"
  end

  def checkout
    @time = (Time.now + (60 * 60)).strftime("%k:%M")
    sms = SMS.new(@time)
    sms.send_confirmation
    p "Thank you! Your order will be delivered by #{@time}"
  end

end
