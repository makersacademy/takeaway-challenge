require_relative 'menu'
require_relative 'orders'
require_relative 'text'
require_relative 'price_calculator'
require_relative 'menu'

require 'rubygems'
#require 'twilio-ruby'

class Takeaway

include Text, PriceCalculator, Menu
attr_accessor :menu_choice, :quantity_total, :total_count

  def initialize
    @menu_choice = {}
    @quantity_total = []
    @total_count = 0

  end

  def select_item
    while @item != "exit" do
      puts "Please type in your order or 'exit' to finish."
      @item = gets.chomp
      return if @item == "exit"
      puts "How many portions would you like?"
      @quantity = gets.chomp.to_i
      @quantity_total << @quantity
      add_items(@item, @quantity)
    end
  end

  def add_items(item, quantity)
    fail "Ooops, that item is not available" unless MENU.include?(item)
    @menu_choice[item] = quantity
    puts "Item added"
  end

  def order_count
    @total_count = @menu_choice.values.inject(:+)
  end

  def confirm_order
    total_price
    puts "The items ordered are #{@order_list}\n"
    puts "The overall price is £#{@overall_price}0 \n"
    puts "Enter 'yes' if you are happy to proceed"
    answer = gets.chomp
    (answer == "yes" || answer == "Yes") ? payment : return
  end

  def payment
    puts "Please check and confirm the payment amount:"
    payment = gets.chomp
      if payment.to_f == @overall_price
        send_text
      else puts "Ooops, something has gone wrong. Please enter the correct amount:"
        confirm_order
      end
  end

end
