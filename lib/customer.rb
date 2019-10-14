require 'receipt'
require 'menu'

require 'order'


class Customer

  include Menu
  include Receipt

  def initialize
    @order = Order.new
  end

  def list_of_menu_items
    Menu.list
  end

  def print_list
    list_of_menu_items.each { |item| puts "* #{item}\n" }
  end

  def add_item_to_order(item)
    @order.add_item(item)
  end

  def receipt
    generate_receipt(@order)
  end

  def print_receipt

    puts "Receipt\n-----------"
    puts receipt
    puts receipt_total(@order.order)
  end




end
