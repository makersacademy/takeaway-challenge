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
    @total += @menu.items[item]
  end

  # @basket.each do |item|
  #   puts "#{item}, £#{@menu.items[item]}"
  # end

  # def add_to_total(item)
  #   @total += @menu.items[item]
  # end
end