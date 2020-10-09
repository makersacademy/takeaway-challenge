require_relative 'menu'

class Basket
  attr_reader :items, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @items = []
    @total = 0
  end

  def add_item(item)
    raise "This item doesn't exist!" if check_if_not_in_menu(item)

    @items << item
    add_to_total(item)
  end

  def show
    raise "Your basket is empty." if @items.empty?

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

  def check_if_not_in_menu(item)
    !@menu.items.include?(item)
  end
end
