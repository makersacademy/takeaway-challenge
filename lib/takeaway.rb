require_relative 'text_sender'

class Takeaway
  def initialize
    @menu = { "pizza" => 8, "salad" => 6, "fish and chips" => 10 }
    @order = []
    @price_list = []
    @final_price = 0
  end

  def place_order
    puts ''
    puts 'Welcome to Takeaway.'
    puts 'Here is our menu:'
    puts @menu
    puts 'Type what you would like to eat from the menu.'
    puts 'When you are finished ordering type: '
    puts 'done'
    puts ''
    puts "What would you like?"
    while true
      new_item = gets.chomp
      if new_item == "done"
        puts ''
        puts "You ordered #{@order}"
        puts ''
        return @order
      elsif new_item != "pizza" and new_item != "salad" and new_item != "fish and chips"
        fail 'Did not enter a valid item'
      else
        @order << new_item
        puts "Anything else?"
      end
    end
  end

  def calculate_total
    order_temp = @order
    while order_temp.length > 0
      if @menu.include?(order_temp[0])
        @price_list << @menu[order_temp[0]]
        order_temp = order_temp[1..-1]
      else
        order_temp = order_temp[1..-1]
      end
    end
    price_list_temp = @price_list
    total_price = 0
    while price_list_temp.length > 0
      total_price = total_price + price_list_temp[0]
      price_list_temp = price_list_temp[1..-1]
    end
    @final_price = total_price
    puts "Your total is #{total_price} pounds"
    Texter.new.send_message
  end
end


takeaway = Takeaway.new
takeaway.place_order
takeaway.calculate_total
