require 'menu'

class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = Menu::TODAYS_MENU
    @order = {}
  end

  def add_item
    puts "Please add an item to your order"
    item = gets.chomp
    @order.store(:item, item)
    how_many
  end

  def how_many
    puts "Great choice! How many of these do you want?"
    item_quantity = gets.chomp
    @order.store(:quantity, item_quantity)
    #puts "We have added #{@order["quantity"]} items of #{@order["item"]} to your order"
  end

end
