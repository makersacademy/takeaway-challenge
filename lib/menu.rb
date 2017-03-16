require_relative 'bill'
require_relative 'customer'
require_relative 'customer_notification'
require_relative 'email_client'
require_relative 'order_item'
require_relative 'order'
require_relative 'twilio_client'
require 'dotenv/load'
require 'csv'

class Menu

  def initialize(item_class = OrderItem)
    @items = []
    @item_class = item_class
    load_items
  end

  def print_menu
    out = ""
    @items.map.with_index {|item,index| out << "#{index + 1}. #{print_item(item)}"}
    out
  end

  def items
    @items
  end

  def print_item(item)
    "#{item.name}: £#{item.price}"
  end

  def load_items
    clear_menu
    CSV.foreach(File.path(menu_file_path), headers: true) do |row|
      add(@item_class.new(name: row["name"], price: row["price"]))
    end
  end

  def add(item)
    @items << item
  end

  def clear_menu
    @items = []
  end

  def menu_file_path
    File.expand_path("../../assets/menu.csv", __FILE__)
  end

end
