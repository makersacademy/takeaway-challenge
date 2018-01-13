require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :basket, :menu
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new, text = Text.new)
    @basket = []
    @menu = menu
    @text = text
  end

  def add_item(item, quantity = DEFAULT_QUANTITY)
    item = capitalize_item(item)
    raise "This item is not on the menu" unless @menu.menu.include?(item)
    @basket << { :item => item, :quantity => quantity }
    "#{quantity} x #{item} added to your basket."
  end

  def delete_item(item, quantity = DEFAULT_QUANTITY)
    item = capitalize_item(item)
    basket_dishes = @basket.map { |dish| dish[:item] }
    raise "This item is not in your basket" unless basket_dishes.include?(item)
    @basket.delete({ :item => item, :quantity => quantity })
  end

  def price
    total_price = 0
    @basket.each { |dish| total_price += @menu.menu[dish[:item]] * dish[:quantity] }
    total_price.round(2)
  end

  def basket_summary
    summary = "You have #{basket_quantity} item(s) in your basket:\n"
    summary = order_summary_breakdown(summary)
    summary += "Your total cost is: £#{price}"
  end

  def place_order
    @text.send_text
  end

  private

  def capitalize_item(item)
    item.split.map(&:capitalize).join(" ")
  end

  def basket_quantity
    @total_quantity = 0
    @basket.each { |dish| @total_quantity += dish[:quantity] }
    @total_quantity
  end

  def order_summary_breakdown(summary)
    @basket.each do |dish|
      total_cost = sprintf("%.2f", @menu.menu[dish[:item]] * dish[:quantity])
      summary += "#{dish[:quantity]} x #{dish[:item]}: £#{total_cost}\n"
    end
    summary
  end
end
