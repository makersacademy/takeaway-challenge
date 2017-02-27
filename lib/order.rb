require_relative "sms"

class Order

  attr_reader :basket, :list

  def initialize
    @basket = []
  end

  def add_dish(number, menu)
    dish = create_dish(number, menu)
    name = dish.item[:name]
    update_basket(dish, name)
  end

  def get_total
    total = 0
    basket.each { |item|
      total += (item[:price] * item[:quantity])}
    total.round(2)
  end

  def print_basket
    empty_basket_message
    puts "Your basket contains:"
    basket.each {|item|
      puts "#{item[:name]} (£#{item[:price]}) - #{item[:quantity]}"}
    puts "Total: £#{get_total}"
  end

  def place_order
    empty_basket_message
    send_text
  end

  private

  def empty_basket_message
    fail "Basket is empty" if basket.empty?
  end

  def already_in_basket?(name)
    basket.any? {|item|
      item[:name] == name}
  end

  def increment_quantity(name)
    basket.each {|item|
      if item[:name] == name
        item[:quantity] += 1
      end
    }
  end

  def update_basket(dish, name)
    if already_in_basket?(name)
      increment_quantity(name)
    else
      @basket << dish.item
    end
  end

  def create_dish(number, menu)
    Dish.new(number, menu)
  end

  def send_text
    SMS.new.send_text
  end

end


# def get_names
#   basket.map { |dish| dish[name] }.uniq
# end
#
# def get_quantities
#   quantity = Hash.new(0)
#   display = []
#   list.each { |dish|
#       quantity[:(dish[:name])] += 1
#         display << {dish[:name], dish[:price], dish[:quantity]
#     }
# end

# def show_basket
#
#   puts "Your basket contains:"
#   basket.each {|item|
#     puts "#{item[:name]} (£#{item[:price]}) - #{item[:quantity]}"}
#   puts "Total: £#{get_total}"
# end

# def add_dish_obj(number, menu)
#   dish = create_dish(number, menu)
#   name = dish.item[:name]
#   @list << dish
# end

# @list = []


#INJECT - you can inject classes and instances
# e.g. to inject class do
#   def initialize (order = Order)
#   end
#
#   then can do order.new later


# (ENV['TWILIO_ACCOUNT_SID'], ENV([AUTHTOK]))
