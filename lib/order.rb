require './lib/menu.rb'

class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new
  end

  def select(items, quantity)
    @basket.store(items, quantity)
  end

  def current_basket
     @basket.map { |item, quantity| puts "#{item} x ".capitalize + "#{quantity}"}
    end

end
