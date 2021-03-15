require './lib/menu.rb'
require './lib/message_sender.rb'

class TakeAway
  attr_reader :menu, :basket, :quantity, :dish

  def initialize(menu = Menu.new.menu, message_sender = MessageSender.new)
    @menu = menu
    @basket = {}
    @message_sender = message_sender
  end

  def read_menu
    @menu
  end

  def order(dish, quantity = 1)
    @dish = dish
    @quantity = quantity
    @basket[@dish] = @quantity
    basket_message
  end

  def basket_message
    "#{@quantity}x #{@dish}(s) added to your basket."
  end
  
  def basket_summary
    @basket.map do |dish, quantity|
      if @menu.has_key?(dish)
        "#{quantity}x #{dish}(s) = £#{@menu[dish] * quantity}"
      end
    end
  end

  def total
    @total = @basket.map do |dish, quantity|
      @menu[dish] * quantity
    end
    @total.sum
  end

  def check_out(payment)
    return nil unless @total.sum == payment

    t = Time.now
    delivery_hour = '%02d' % (t.hour + 1)
    delivery_minutes = '%02d' % t.min
    "Thank you! Your order was placed and will be delivered before #{delivery_hour}:#{delivery_minutes}"
  end
end
