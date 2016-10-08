require_relative 'menu'
require_relative 'orders'


class Takeaway

  attr_accessor :menu_choice

  def initialize
    @menu_choice = {}
    @quantity_total = []
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
    @menu_choice
  end

  def add_items(item, quantity)
    fail "Ooops, that item is not available" unless Menu::MENU.include?(item)
    @menu_choice[item] = quantity
    puts "Item added"
  end

  def order_count
    @total_count = @menu_choice.values.inject(:+)
  end

  def show_order
    p @menu_choice
    "You have ordered #{@menu_choice.count} different types of dish and #{order_count} dishes in total."
  end


end
