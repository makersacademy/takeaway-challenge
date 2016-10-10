require_relative 'menu'
require_relative 'dish'
require_relative 'sms'

class Order

attr_reader :selection

  def initialize(menu)
    @menu = menu
    @selection = []
  end

  def add_dish(dish, quantity)
    fail 'That dish is not available' unless @menu.dishes.include?(dish)
    quantity.times {@selection << dish}
  end

  def total_price
    @bill = 0
    @selection.each do |dish|
      @bill += dish.price
    end
    @bill
  end

  def confirmation
    message = SMSConfirmation.new
    message.send(confirmation_message)
  end

  private

  def confirmation_message
    hours_time = Time.new + 60*60
    "Thank you! Your order was placed and will be delivered before #{hours_time.strftime('%H:%M')}"
  end

end
