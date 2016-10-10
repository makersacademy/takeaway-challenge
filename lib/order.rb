require_relative "text"

class Order

  attr_reader :total_price, :items, :estimated_delivery_time

  MAX_NAME_LENGTH = 20
  DELIVERY_TIME = 30

  def initialize(credentials)
    @total_price = 0
    @items = []
    @credentials = credentials
  end

  def add(item, quantity =1)
    quantity.times do
      add_item(item)
      increment_total_price(item.price)
    end
  end

  def remove(item, quanity =1)
    quanity.times do
      return unless @items.include?(item)
      remove_item(item)
      decrement_total_price(item.price)
    end
  end

  def receipt
    output = "\nYou ordered:\n"
    @items.uniq.each {|item| output += "#{@items.count(item)} x #{item.name.ljust(MAX_NAME_LENGTH, ' ')} £#{item.price * @items.count(item)}\n"}
    output += "for a total of".ljust(MAX_NAME_LENGTH + 5, ' ') + "£#{@total_price}\n"
  end

  def place(payment)
    payment < @total_price ? "That's not enough money, please try again" : confirm_order(payment)
  end

  private

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    @items.delete_at(@items.index(item))
  end

  def increment_total_price(amount)
    @total_price += amount
  end

  def decrement_total_price(amount)
    @total_price -= amount
  end

  def confirm_order(payment)
    @estimated_delivery_time = delivery_time
    text
    tip?(payment)
  end

  def tip?(payment)
    "Thank you for the tip!" if payment > @total_price
  end

  def delivery_time
    Time.new + DELIVERY_TIME * 60
  end

  def text
    message = "Thank you for your order! Estimated delivery time: #{@estimated_delivery_time.hour}:#{@estimated_delivery_time.min.round(-1)}"
    text = Text.new(message, @credentials)
    text.send_text
  end
end
