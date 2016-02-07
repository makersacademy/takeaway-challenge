require_relative 'menu'
require_relative 'calculate_bill'
require_relative 'message'

class Order 

  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def show_menu
    tidy_menu
  end

  def choose(pizza, quantity)
    ordered_items << {pizza => quantity}
  end

  def total_cost
    calc = CalculateBill.new
    calc.final_total(@ordered_items)
  end

  def check_total
    calc = CalculateBill.new
    calc.itemised_bill(@ordered_items)
  end

  def tidy_menu
    puts MENU.map{ |k,v| (k + "  £" + v.to_s) }
  end

  def send_message
    send_private_message
  end

  private

  def send_private_message
    message = Message.new
    message.send(check_total)
  end

end