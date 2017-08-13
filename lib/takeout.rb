require './lib/send-sms.rb'

class Takeout

  attr_reader :basket

  def initialize
    @dishes = Menu.new.dishes
    @basket = []
  end

  def add_dish(dish, quantity = 1)
    @dishes.select do |key, value|
      @basket << [key, value, quantity] if key == dish.downcase.to_sym
    end
  end

  def total_price
    total = 0
    @basket.each { |dish, price, quantity| total += price*quantity }
    total
  end

  def current_basket
    arr = []
    @dishes.each do |dish, price|
      @basket.each do |d, p|
      arr << "#{dish.capitalize}: £#{price}" if dish == d
      end
    end
    puts arr
  end

  def read_menu
    @dishes.each do |dish, price|
      puts "#{dish.capitalize}: £#{price}"
    end
  end

  def check_price
    puts "Total price: £#{total_price}"
    "#{current_basket}"
  end

  def checkout(sum)
    raise 'Incorrect sum' unless sum == total_price
    send_text "Success! Your order has been placed. #{complete_order}"
  end

  private

  def send_text(message)
    Texter.new.send_text(message)
  end

  def complete_order
    "#Your order total price is £#{total_price}"
  end


end