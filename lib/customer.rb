require_relative 'twilio'
require_relative 'menu'

class Customer
  attr_reader :basket, :text_provider

  def initialize(menu=Menu.new)
    @menu = menu
    @basket = {}
    @text_provider = TwilioAPI.new
  end

  def read_menu
    @menu.read
  end

  def add(dish, quantity=1)
    fail 'That dish is not on our menu.' unless @menu.dishes.key?(dish)
    basket.store(dish, quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def total
    total = calculated_total
    "Total: £#{total.round(2)}"
  end

  def basket_summary
    fail 'Your basket is empty, order something!' if basket.empty?
    summary = []
    @basket.map do |dish, x|
    summary << "#{dish} x#{x} = £#{(@menu.dishes[dish] * x).round(2)}"
    end
    summary.join(", ")
  end

  def checkout(payment)
    total = calculated_total.round(2)
    fail 'Please input the correct amount or more :)' unless payment >= total
    @text_provider.send_sms(payment)
    'Your order has been received, you should get a confirmation text soon.'
  end

  private

  attr_reader :menu

  def calculated_total
    @basket.map {|dish, x| @menu.dishes[dish] * x}.inject(0, :+)
  end
end
