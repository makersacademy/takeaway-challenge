require_relative './menu'
require_relative './send_sms'

class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :price_store, :total, :menu, :send_sms

  def initialize(menu = Menu.new, send_sms = SendSms.new)
    @menu = menu
    @basket = []
    @price_store = []
    @total = DEFAULT_TOTAL
    @send_sms = send_sms
  end

  def add_dish(dish)
    @menu.dish_list.each do |food, price|
      @basket << { dish => price } if dish == food
    end
    add_prices(dish)
  end

  def show_basket
    puts "Your current order:"
    @basket.each do |item, price|
      puts "#{item.keys.join} price: #{item.values.join}"
    end
    puts "Total: #{get_total}"
  end

  def get_total
    @total = @price_store.sum
  end

  def complete_order(total_price)
    send_text("Thank you for your order of £#{total_price}")
  end

  private

  def add_prices(dish)
    @menu.dish_list.each do |food, price|
      @price_store << price if dish == food
    end
  end

  def send_text(message)
    @send_sms.send(message)
  end

end
