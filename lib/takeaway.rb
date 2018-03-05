require "./lib/customer.rb"
require './lib/menu.rb'
require "./lib/messenger.rb"

class Takeaway
  attr_reader :menu, :basket, :prices
  attr_accessor :total
  def initialize(menu = Menu.new)
    @total = 0
    @basket = []
    @menu = menu

  end

  def list_menu
    puts "=" * 75
    puts " ======== Makers Carribbean Takeaway"
    puts "=" * 75
    ("1".."7").zip(@menu.prices).each { |x, y| puts "#{x}) #{y[0]} #{y[1]}" }
    puts "=" * 75
  end

  def list_basket
    puts (@basket.each { |x| @menu.prices[x] }).zip(@basket)
  end

  def add_to_basket(food, quantity = 1)
    quantity.times do
      @basket << @menu.menu[food]
    end
    update_total
    @basket
  end

  def remove_from_basket(food)
    @basket.delete(@menu.menu[food])
    update_total
  end

  def update_total
    @total = 0
    @basket.each { |x| @total += @menu.prices[x] }
    @total
  end

  def checkout(name, address, messenger = Messenger.new)
    customer = Customer.new
    customer.name = name
    customer.address = address
    customer.order << @basket
    messenger.message
  end
end
