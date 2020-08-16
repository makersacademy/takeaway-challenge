require_relative 'text'

class Order

  attr_accessor :menu, :text

  def initialize(text = Text_message.new)
    @menu = @menu = {
      "Sushi set" => 12,
      "Prawn katsu curry" => 9,
      "Kitsune udon" => 7,
      "Onigiri" => 3,
      "Matcha ice-cream" => 4
    }
    @total = 0
    @order = []
    @text = text
  end

  def print_menu
    @menu.each { |key, value| puts " #{key}: £#{value}" }
  end

  def user_order(food)
    if @menu.include?(food) == true
      @order.push(food)
      print @order
    elsif food == 'done'
      puts "Order total £#{order_total}"
      @text.send_text
    elsif @menu.include?(food) == false
      puts "Item not on menu"
      return
    end
  end

  def order_total
    @order.each do |item|
      price = @menu.fetch(item)
      @total += price
    end
    return @total
  end
end