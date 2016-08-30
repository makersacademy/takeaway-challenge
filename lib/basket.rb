require_relative 'menu'

class Basket

attr_accessor :basket

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  def display_basket
    message = "Items in your basket:"
    (@basket.each{|k,v|puts "#{message} #{k} x #{v} x £#{@menu.menu[k]}0"}).to_s
  end
end
