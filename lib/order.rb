require 'dotenv/load'
require_relative 'menu'
require_relative 'pricecalculation'
require_relative 'send_sms'

class Order

  attr_reader :menu
  attr_reader :summary
  attr_reader :quantity
  attr_reader :current_order

  include SendMessage
  def initialize(menu = Menu.new, quantity = 1,
                  calc = PriceCalculation.new(self))
    @menu = menu
    @quantity = quantity
    @current_order = []
    @calc = calc
  end

  def read_menu
    @menu.show
  end

  def select(dish, quantity = 1)
    puts "#{quantity} X #{dish}(s) added to order"
    @current_order << { dish => quantity }
  end

  def order_summary
    @summary = @calc.total
  end

  def total_price
    @total_price = @calc.total_price
    @total_price.round(2)
  end

  def total_cost
    "Total: £#{total_price}"
  end

  def checkout
    send_sms
  end

  def order_string
    "Thank you! Your order of #{summary} was placed.
    It will be delivered before #{time_calc}.
    Your order total comes to: £#{total_price}."
  end

  def time_calc
    t = Time.now
    tu = t + (60 * 60)
    tu.strftime("%k:%M")
  end
end
