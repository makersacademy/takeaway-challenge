require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket
  include Menu, Order

  def initialize
    @menu = read_menu
    @basket = []
  end

  def order(item, number=1)
    number.times{@basket << add_to_order(item)}
    "#{number} x #{item} added to basket"
  end

  def total
    @total = 0
    @basket.each {|x| x.each {|_key, value| @total += value}}
    "Total: £#{format('%.02f', (@total.to_f / 100))}"
  end


end
