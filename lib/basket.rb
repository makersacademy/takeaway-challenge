require_relative 'menu'

class Basket
  attr_reader :items, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @items = []
    @total = 0
  end

  def add_item(item)
    @items << item
    add_to_total(item)
  end

  def show
    @items.each do |item|
      puts "#{item}, £#{@menu.items[item]}"
    end

    print_total
  end

  def empty
    @items = []
  end

  private
  def add_to_total(item)
    @total += @menu.items[item]
  end

  def print_total
    puts "Your total is: £#{@total}."
  end
end