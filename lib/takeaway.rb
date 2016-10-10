require_relative 'menu'
require_relative 'order'
require_relative 'text'
require_relative 'menu'

require 'rubygems'
require 'twilio-ruby'

class Takeaway

include Text, Order, Menu
attr_accessor :menu_choice, :quantity_total, :total_count

  def initialize
    @menu_choice = {}
    @quantity_total = []
    @total_count = 0
  end

  def select_item
    while @item != "finish" do
      puts "Please type in your order or 'finish' to complete your order."
      @item = gets.chomp
      return if @item == "finish"
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
    puts "The items ordered are #{menu_choice}\n"
    puts "The overall price is £#{@overall_price}0 \n"
    puts "Enter 'yes' to comnplete order"
    answer = gets.chomp
    (answer == "yes" || answer == "Yes") ? payment : return
  end

  def payment
        send_text
        confirm_order
  end

end
