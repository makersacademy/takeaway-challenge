require_relative 'csv_reader'
require_relative 'order'
require_relative 'text_service'

class Takeaway

  DEFAULT_MENU = "#{Dir.pwd}/lib/dishes.csv"

  def initialize(order: Order.new,
                 sms: TextService.new,
                 csv: CsvReader.new(file: DEFAULT_MENU))
    @csv = csv
    @order = order
    @sms = sms
    get_menu
  end

  def show_menu
    menu
  end

  def add_to_order(dish, quantity = 1)
    raise 'Dish does not exist in menu' unless dish_exists?(dish)
    order.select_dish(dish: dish, quantity: quantity, price: get_price(dish))
  end

  def view_basket
    order.basket
  end

  def view_total
    round_total(order.total)
  end

  def confirm_total(total)
    raise 'Nothing in basket' if order.basket.empty?
    raise "Incorrect total provided" unless round_total(order.total) == total
    text_order
  end

  private

  attr_accessor :order_complete
  attr_reader :csv, :order, :menu, :sms

  def round_total(total)
    sprintf('%.2f', total).to_f
  end

  def get_menu
    @menu = csv.menu
  end

  def get_price(dish)
    menu[dish]
  end

  def dish_exists?(dish)
    menu.include? dish
  end

  def empty_basket
    order.clear_basket
  end

  def text_order
    raise "Order already processed" if order_complete
    self.order_complete = true
    empty_basket
    sms.send_sms(get_delivery_message)
  end

  def get_delivery_time
    time = Time.now + (1 * 60 * 60)
    time.strftime('%-H:%M')
  end

  def get_delivery_message
    "Thank you! Your order was placed and will be delivered before " +
    "#{get_delivery_time}"
  end

end
