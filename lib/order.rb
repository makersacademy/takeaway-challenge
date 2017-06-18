require_relative 'menu.rb'
class Order

  attr_reader :food_items

  def initialize(menu = Menu.new)
    @food_items = []
    @menu = menu
  end

  def total
    @total = @food_items.map { |x| x[:price] * x[:quantity] }.reduce(:+).round(2)
  end

  def input
    while true
      item_number = ask_one_item
      break if item_number == 'exit'
      if check_item(item_number.to_i)
        quantity = ask_quantity
        add_item_to_order(item_number.to_i, quantity)
      else
        puts 'Item not in the menu, please chose another one'
      end
    end
  end

  def ask_order
    puts 'Please enter your order. When ready type exit.'
    input
    @food_items
  end

  def add_item_to_order(item_number, quantity)
    if check_item(item_number)
      item_in_the_menu = line_in_the_menu(item_number)
      item_in_the_menu[:quantity] = quantity
      @food_items << item_in_the_menu
    end
  end

  def check_item(item_number)
    !!line_in_the_menu(item_number)
  end

  private
  def line_in_the_menu(item_number)
    line = nil
    @menu.list.each do |x|
      if x[:item] == item_number
        line = x.clone
        break
      end
    end
    line
  end

  def ask_quantity
    puts 'Enter quantity:'
    gets.chomp.to_i
  end

  def ask_one_item
    puts 'Enter the number of the item you want to order'
    gets.chomp
  end

end
