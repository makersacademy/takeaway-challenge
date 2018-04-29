require_relative './message'

class Order
  attr_reader :items

  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add(dish, amount = 1)
    raise 'Not on menu' unless on_menu?(dish)

    return add_existing_dish(dish, amount) if dish_on_order?(dish)
    add_new_item(dish, amount)
  end

  def list
    empty_order_error

    @items.each do |item|
      puts "#{item[:amount]} x #{item[:dish].name}"
    end
  end

  def total
    empty_order_error

    @items.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end

  def confirm(message_class = Message)
    empty_order_error

    text = "Your order was placed and will be delivered before #{delivery_time}"
    puts text
    message = message_class.new(text)
    message.send
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def add_existing_dish(dish, amount)
    @items.each do |item|
      item[:amount] += amount if same?(item, dish)
    end
  end

  def add_new_item(dish, amount)
    @items.push({ dish: dish, amount: amount })
  end

  def dish_on_order?(dish)
    @items.any? { |item| same?(item, dish) }
  end

  def same?(item, dish)
    item[:dish] == dish
  end

  def empty_order?
    @items.empty?
  end

  def empty_order_error
    raise 'The order is empty' if empty_order?
  end

  def delivery_time
    time = Time.new
    "#{(time.hour + 1) % 24}:#{time.min}"
  end
end
