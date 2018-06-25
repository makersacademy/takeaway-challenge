require './lib/menu.rb'
require './lib/sms_sender.rb'

class Order
  ITEM_MAX_LENGTH = 50
  PRICE_MAX_LENGTH = 7

  attr_reader :items

  def initialize
    @items = []
  end

  def list
    @items.each { |item| prettify(item) }
  end

  def prettify(item)
    STDOUT.print item[:name].ljust(ITEM_MAX_LENGTH)
    STDOUT.puts item[:price].rjust(PRICE_MAX_LENGTH)
  end

  def add(item)
    @items << item
  end

  def print_total
    "£%.2f" % total
  end

  def total
    @items.map { |item| item[:price].gsub(/£/, '').to_f }.sum.round(2)
  end
end
