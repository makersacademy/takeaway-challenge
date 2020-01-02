require_relative 'menu'
require_relative 'message'

class TakeAway
  attr_reader :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = Hash.new
  end

  def read_menu
    @menu.dishes
  end

  def order(item, amount = 1)
    raise "Not in menu" unless @menu.dishes.include? item

    @orders[item] = amount
    "#{amount}x #{item}(s) added to your basket."
  end

  def add(item, amount = 1)
    raise "Not in menu" unless @menu.dishes.include? item

    @orders[item] = amount
    "#{amount}x #{item}(s) added to your basket."
  end

  def basket_summary
    orders.each do |item, amount|
      # @menu.dishes.each do |food, price|
      #   total_item = (amount * price).round(2)
      #   puts "#{item} x#{amount} = £#{total_item}" if food == item
      # end
      total_item = (amount * @menu.price(item)).round(2)
      puts "#{item} x#{amount} = £#{total_item}"
    end
  end

  def total
    total = 0
    orders.each do |item, amount|
      total_item = (amount * @menu.price(item)).round(2) 
      total += total_item
    end
    "Total: £#{total}"
  end

  def complete_order(total_price)
    send_text("Thank you for your oder: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end

end
