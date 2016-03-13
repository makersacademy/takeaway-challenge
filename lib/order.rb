require_relative 'takeaway'
require_relative 'checkout'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Order
  attr_reader :basket, :subtotal, :total, :menu

  def initialize
    @basket = {}
    @subtotal = []
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheese pizza" => 2.87,
             "pepperoni pizza" => 3.93}
  end

  def add_to_basket(selection)
    basket.merge!(selection)
    current_price(selection)
  end

  def total
    total_price
  end

  def basket_summary
    summarise_order
  end

  private

  def current_price(selection)
    selection.each do |item, count|
      price = count * @menu[item]
      subtotal << price
    end
  end

  def total_price
    @total = @subtotal.reduce(0, :+).round(2)
  end

  def summarise_order
    summary = ''
    @basket.each do |item, qty|
      string = "#{item}(s) x#{qty}, £#{menu[item]} each. "
      summary << string
    end
    total_price = "Total: £#{total}"
    summary << total_price
    summary
  end

end
