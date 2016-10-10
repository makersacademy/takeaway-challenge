require_relative 'takeaway.rb'
require_relative 'text.rb'

class Order

  def initialize(takeaway = Takeaway.new)
    @basket = Hash.new(0)
    @total = 0
    @takeaway = takeaway
  end

  def view_menu
    @takeaway.menu
  end

  def add_item(item, quantity = 1)
    if @takeaway.menu.include?(item)
      @basket[item] = quantity
      @basket
    else
      raise "Please only select items from the menu"
    end
  end

  def view_basket
    @basket
  end

  def checkout
    "Your price breakdown comes to #{price_breakdown} which makes your total #{final_price}"
  end

  def place_order
    new_message = Text.new
    new_message.send_message(confirmation_text)
  end

private
  def price_breakdown
    @basket.map do |item, quantity|
      "#{item} x #{quantity} = £#{@takeaway.menu[item] * quantity}"
    end
  end

  def final_price
    @basket.map do |item, quantity|
      @total += @takeaway.menu[item] * quantity
    end
    "£#{@total}"
  end

  def delivery_time
     time = (Time.new + 3600).strftime("%H:%M")
  end

  def confirmation_text
     "Thank you for placing your order! Your order will arrive before #{delivery_time}."
  end

end
