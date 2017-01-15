require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket
  include Menu, Order

  def initialize
    @basket = []
  end

  def order(item, number=1)
    number.times{@basket << add_to_order(item)}
    "#{number} x #{item.upcase} added to basket"
  end

  def total
    @total = 0
    @basket.each {|x| x.each {|_key, value| @total += value}}
    "Total: £#{format('%.02f', (@total.to_f / 100))}"
  end

  def basket_summary
    return "No items added" if @basket.empty?
    basket.each do |addeditem|
      addeditem.each do |item, price|
        puts "#{item} = £#{format('%.02f', (price.to_f / 100))}"
      end
    end
  end


end
