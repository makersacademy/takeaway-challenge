class Order

  attr_reader :total_price, :items

  MAX_NAME_LENGTH = 20
  DELIVERY_TIME = 30

  def initialize
    @total_price = 0
    @items = []
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
    @items.uniq.each {|item| output += "#{@items.count(item)} x #{item.name.ljust(MAX_NAME_LENGTH,' ')} £#{item.price*@items.count(item)}\n"}
    output += "for a total of".ljust(MAX_NAME_LENGTH + 5,' ') + "£#{@total_price}\n"
  end

  def place(payment)
    payment < @total_price ? "That's not enough money, please try again" : confirm_order(payment)
  end

  def text
    t = delivery_time
    message = "Thank you for your order! Estimated delivery time: #{t.hour}:#{t.min.round(-1)}"
    text = Text.new(message)
    text.send
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
    text
    "Thank you for the tip!" if payment > @total_price
  end

  def delivery_time
    Time.new + DELIVERY_TIME*60
  end



end
