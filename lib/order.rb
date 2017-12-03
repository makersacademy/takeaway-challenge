require_relative 'menu'

class Order

  attr_reader :basket, :menu
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add_order(item, quantity = DEFAULT_QUANTITY)
    item = item.split.map(&:capitalize).join(" ")
    raise "This item is not on the menu" unless @menu.menu.include?(item)
    quantity.times { @basket << item }
    puts "#{quantity} x #{item} added to your basket."
  end

  def price
    total_price = 0
    @basket.each { |item| total_price += @menu.menu[item] }
    total_price.round(2)
  end

  def basket_summary
    summary = "You have #{@basket.count} item(s) in your basket:\n"
    @basket.each do |item|
      summary += "#{item}: £#{sprintf("%.2f", @menu.menu[item])}\n"
    end
    summary += "Your total cost is: £#{price}"
  end

end
