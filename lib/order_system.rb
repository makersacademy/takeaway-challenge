# Understands the takeaway order system

require_relative 'twilio_notification'

class OrderSystem

  attr_reader :menu, :order_in_progress, :total_cost, :pending_order, :text

  def initialize(menu = Menu.new, text = TwilioNotification.new)
    @menu = menu
    @order_in_progress = nil
    @total_cost = 0
    @pending_order = []
    @text = text
  end

  def order_request
    order_intro = 'What would you like to order?'
    return order_intro unless !!order_in_progress
  end

  def add_to_order(item, number = 1)
    if menu.dishes.has_key?(item)
      number.times do
        @pending_order << item
        @total_cost += menu.dishes[item]
      end
    end
    "#{number} #{item}(s) added to your order."
  end

  def confirm_order(total_submitted)
    message = "Your submitted order total of #{total_submitted} is not correct."
    raise message if total_cost.round(2) != total_submitted
    order_placed
  end

 # Probably refactor this out to twillo
  def order_placed
    @order_in_progress = true
    text.send_message
    return "Total cost is #{total_cost.round(2)}. Thank you for your order."
  end

end
