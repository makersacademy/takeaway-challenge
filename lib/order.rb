require_relative 'menu'

class Order

  attr_reader :basket, :menu
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add_item(item, quantity = DEFAULT_QUANTITY)
    item = item.split.map(&:capitalize).join(" ")
    raise "This item is not on the menu" unless @menu.menu.include?(item)
    @basket << { :item => item, :quantity => quantity }
    "#{quantity} x #{item} added to your basket."
  end

  def price
    total_price = 0
    @basket.each { |dish| total_price += @menu.menu[dish[:item]] * dish[:quantity] }
    total_price.round(2)
  end

  def basket_summary
    p summary = "You have #{@total_quantity} item(s) in your basket:\n"
    @basket.each do |dish|
      total_cost = sprintf("%.2f", @menu.menu[dish[:item]] * dish[:quantity])
      summary += "#{dish[:quantity]} x #{dish[:item]}: £#{total_cost}\n"
    end
    p summary += "Your total cost is: £#{price}"
  end

  private

  def basket_quantity
    @total_quantity = 0
    @basket.each { |dish| @total_quantity += dish[:quantity] }
  end

  def order_summary_breakdown

    basket_quantity
  end

end
