require_relative "sms"

class Order

  attr_reader :basket, :list

  def initialize
    @basket = []
  end

  def add_dish(number, menu)
    dish = create_dish(number, menu)
    @basket << dish
  end

  def get_total
    total = 0
    basket.each { |dish|
      total += dish.details[:price]}
    total.round(2)
  end

  def print_basket
    empty_basket_message
    puts "Your basket contains:"
    basket_summary
    puts "Total: £#{get_total}"
  end

  def place_order
    empty_basket_message
    confirmation_message
    send_text
  end

  private

  def basket_summary
    basket.each {|dish|
      puts "#{dish.details[:name]} - (£#{dish.details[:price]})"}
  end

  def empty_basket_message
    fail "Basket is empty" if basket.empty?
  end

  def confirmation_message
    puts "Thank you. Your order has been placed. You will shortly receive a text confirming your delivery time."
  end

  def create_dish(number, menu)
    Dish.new(number, menu)
  end

  def send_text
    SMS.new.send_text
  end

end
