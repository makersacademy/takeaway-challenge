require_relative 'takeaway'
require_relative 'basket'
require 'twilio-ruby'

class Menu

  require 'csv'

  attr_reader :items

  def initialize
    @items = []
  end

  def view_menu
    format_menu
  end

  def add_to_menu(name, price)
    item = {name => ("%.2f" % price).to_f }
    @items << item
  end

  def import_items(filename = 'italian.csv')
    get_csv_info(filename)
  end

  private

  def format_menu
    raise "There are no dishes currently available" if items.length == 0
    @items.each.with_index(1) do | item, index|
      item.each do |name, price|
        puts "#{index}".ljust(20) + "#{name}".center(20) + "£#{price}".rjust(20)
      end
    end
  end

  def get_csv_info(filename)
    CSV.foreach(filename) do |line|
      name = line[0]
      price = line[1]
      @items.push({name => ("%.2f" % price).to_f})
    end
  end
end
