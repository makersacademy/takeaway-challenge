require_relative "message"

class Restaurant

  attr_reader :menu, :basket, :message

  def initialize
    @menu = {
      "Chicken Souvlaki Wrap" => 8,
      "Haloumi Souvlaki Wrap" => 7,
      "Falafel Souvlaki Wrap" => 7,
      "Chips" => 4,
      "Water" => 1,
      "Coke" => 2
    }
    @basket = Hash.new(0)
    @message = Message.new
  end
  
  def show_menu
    @menu.each { |dish, price| puts "#{dish} - £#{price}" } 
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def order_summary
    @basket.each { |dish, quantity| puts "#{quantity}X #{dish} = £#{@menu[dish] * quantity}" }
    puts "Total: £#{total_cost}"
  end

  def confirm_order
    @message.send_message
  end
  private

  def total_cost
    total = 0
    @basket.each { |dish, quantity| total += @menu[dish] * quantity }
    total
  end
end
