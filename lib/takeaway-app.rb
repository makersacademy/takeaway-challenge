require_relative 'order'
#require 'twilio-ruby'

class TakeAwayApp
  def initialize
    @menu = {"Pizza" => 18.99, "Curry" => 7.49, "Fish & Chips" => 12.39, "Kebab" => 6.19 } 
    @orders = Array.new
  end
   
  def show_menu
    puts @menu.map { |key_meal, value_price|
    " #{key_meal} : #{value_price} "
    }.join("\n")
  end
  
  def make_order
    input = ""
    meals = Array.new
    puts "enter 'finish' to complete order"
    while input != "finish" do
      input = gets.chomp!
      @menu.key?(input) == true ? meals.push(input) : puts("meal '#{input}' does not exits!")
    end
    @orders.push(Order.new(break_into_hash(meals)))
    true
  end
  
  def confirm_order(order_number)
    @orders[order_number].confirm
    puts "The cost of this order is £#{calculate_price(@orders[order_number])}"
  end
  
  private
  
  def break_into_hash(array)
    hash = {}
    array.each do |key, value|
      if hash.key?(key)
        hash[key] = hash[key] + 1
      else
        hash[key] = 1
      end
    end
    hash
  end
  
  def calculate_price(an_order)
    total = 0.00
    an_order.food_items.each do |key, value|
      total += @menu[key] * value
      puts @menu[key] * value
    end
    total
  end
end