require_relative './menu'
require_relative './send_sms'

class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :price_store, :total, :menu, :send_sms

  def initialize(menu = Menu.new, send_sms = SendSms)
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
    p "Your current order:"
    @basket.each do |item, _price|
      p "item: #{item.keys.join} price: #{item.values.join}"
    end
    p "Total: #{finalise_total}"
  end

  def confirm
    @send_sms.new.send
  end

  private

  def add_prices(dish)
    @menu.dish_list.each do |food, price|
      @price_store << price if dish == food
    end
  end

  def finalise_total
    @total = @price_store.sum
  end

end
