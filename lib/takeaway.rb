#require_relative 'menu'

class Takeaway
  attr_reader :menu
  attr_accessor :menu_selection

  def initialize
    @menu_choice = {}
    @menu = {
      "Chicken" => 1.00,
      "Madras" => 2.00
    }
  end

  def show_menu
    menu.each { |item, price| "#{item}, #{price}"}
  end

  def customer_choice
    @item = ""
      while @item != "exit"
        select_item
        break if @item == "exit"
        select_quantity
        add_items
      end
  end

  def select_item
    puts "Please type in your order or 'exit' to finish."
    @item = gets.chomp
  end

  def select_quantity
    puts "How many portions would you like?"
    @quantity = gets.chomp
  end

  def add_items
    @menu_choice[@item] = @quantity
  end

  def show_order
    p @menu_choice
  end

end
