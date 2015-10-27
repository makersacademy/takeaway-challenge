require_relative 'messager'

class Order
  attr_reader :basket, :menu, :complete, :messager, :processed

  def initialize(menu_instance: menu, messager: Messager)
    @menu = menu_instance
    @basket = Hash.new(0)
    @messager = messager
    @processed = false
  end

  def add(item, qty)
    basket[item] += qty
    "#{item} x#{qty} added to your basket"
  end

  def overview
    return 'Basket is empty' if basket.empty?
    basket.map { |item, qty| "#{item} x#{qty}: £#{price(item, qty)}"}
      .join("\n") + "\n" + total
  end

  def checkout(price = 0)
    return 'Basket is empty' if basket.empty?
    return 'Wrong total' if wrong_total?(price)
    @processed = true
    send_text
  end

  def price(item, qty)
    price = qty * menu.dishes[item].to_f
    format('%.2f', price)
  end

  def reset
    @basket = Hash.new(0)
  end

  def send_text
    message = messager.new
    message.send_text(overview)
  end

  private
  def total
    "Total price: £" + calculate_price.to_s
  end

  def complete?
    @processed
  end

  def wrong_total?(price)
    calculate_price != price
  end

  def calculate_price
    basket.map { |item, qty| price(item, qty).to_f }.inject(:+)
  end

end
