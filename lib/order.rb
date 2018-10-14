require_relative 'menu'

class Order

  attr_reader :total

  def initialize(menu)
    @items = {}
    @menu = menu
    @total = 0
  end

  def add(item, quantity)
    @total += (quantity * @menu.items[item].to_f)
    @items[item] += quantity if @items.include?(item)
    @items[item] = quantity unless @items.include?(item)
  end

  def display_menu
    @menu.items.map { |item, price| "#{item} £#{price.to_f}" }.join("\n")
  end

  def items
    @items.dup
  end

  def complete(total)
    raise "Total incorrect, please try again" if @total != total
    message = TextConfirm.new
    message.send
  end
end
