require_relative 'menu'

class TakeAway
  attr_reader :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = Hash.new
  end

  def read_menu
    @menu.dishes
  end

  def order(item, amount=1)
    raise "Not in menu" if !@menu.dishes.include? item
    @orders[item] = amount
    "#{amount}x #{item}(s) added to your basket."
    # @menu.dishes.each do |food, price|
    #   # if item == food
    #   #   @orders[item] = amount
    #   #   puts "#{amount}x #{item}(s) added to your basket."
    #   # else
    #   #   raise "Not in menu"  
    #   # end
    # end
  end

  def add(item, amount=1)
    @orders[item] = amount
    "#{amount}x #{item}(s) added to your basket."
  end

  def basket_summary
    orders.each do |item, amount|
      @menu.dishes.each do |food, price|
        if food == item
          puts "#{item} x#{amount} = £#{amount*price}"
        end
      end
    end
  end

  def complete_order(total_price)
    send_text("Thank you for your oder: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end

end

# t = TakeAway.new
# t.order("spring roll", 2)
# t.add("char sui bun", 5)
# t.basket_summary