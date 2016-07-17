require_relative 'menu'

class Takeaway
  attr_reader :order

  def initialize
    @order = {}
  end

  def show_menu
    Menu::TODAYS_MENU
  end

  def add_item(item)
    if Menu::TODAYS_MENU.has_key?(item.to_sym)
      @order.store(:item, item)
      how_many
    else check_spelling
    end
  end

  def check_spelling
    puts "Please make sure that we have it on our menu. Here it is:"
    Menu::TODAYS_MENU
  end

  def how_many
    puts "Great choice! How many of these do you want?"
    item_quantity = gets.chomp
    @order.store(:quantity, item_quantity.to_i)
    puts "We have added #{@order[:quantity]} #{@order[:item]}s to your order"
  end

  def check_order

  end

end
