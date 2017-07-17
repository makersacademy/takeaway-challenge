require_relative 'messenger'

class Order

  attr_reader :total

  def initialize(menu, messenger_class = Messenger)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
    @placed = false
    @messenger_class = messenger_class
  end

  def read_menu
    @menu.to_s
  end

  def basket
    @basket.dup
  end

  def placed?
    @placed
  end

  def add(dish_name, quantity = 1)
    return "Cannot add, order already placed" if placed?
    return "Cannot add, #{dish_name} is not on the menu" unless @menu.dishes[dish_name]
    update_total(@menu.dishes[dish_name], quantity)
    update_quantity(dish_name, quantity)
  end

  def checkout(amount)
    return "Cannot checkout, order already placed" if placed?
    return "Cannot checkout, basket is empty" if @basket.empty?
    return "Incorrect amount" unless amount == total
    complete_order
    send_text_message
  end

  private

  def update_total(dish_price, quantity)
    @total += dish_price * quantity
  end

  def update_quantity(dish_name, quantity)
    @basket[dish_name] += quantity
    "#{quantity}x #{dish_name} added to your basket"
  end

  def complete_order
    @placed = true
  end

  def send_text_message
    time = Time.new + 60 * 60
    text = "Thank you! Your order will be delivered before #{time.hour}:#{time.min}"
    @messenger_class.new.send_message(text)
  end
end
