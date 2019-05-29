require 'menu.rb'
class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
    @total = 0
    @menu = Menu.new
  end

  def add(item, cost)
    @basket << {food:item, price:cost}
    # @menu.see_menu.each {|array|
    # if array.any? {|menu| menu == item}
    #   puts "hello"
    # end}
  end

  def total
    total = @basket.map { |item| item[:price] }.sum
  end

end
