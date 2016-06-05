require './lib/send_sms'
class Total

  attr_reader :total

  def initialize(order)
    @total = 0
    @order = order
  end

  def calculate_total
    @total = 0
    menu = Menu.new
    @order.order_made.each do |item|
      if menu.menu_card.key?(item[0])
        @total += (item[1] * menu.menu_card[item[0]])
      end
    end
    @total
  end

  def show_total
    calculate_total
    return "Total amount: #{@total}"
  end


end
