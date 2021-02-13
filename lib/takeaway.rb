require_relative './checkout.rb'
require 'bigdecimal'

class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = {
      'bibimbap'=>10.50,
      'bulgogi'=>10,
      'naengmyeon'=>8
    }
    @basket = []
  end

  def add_to_basket(item, quantity)
    self.menu.map do |food, price|
      if item == food
        @basket.push("#{item} x #{quantity.to_s}: £")
        @basket.push((price * quantity))
      end
    end
    puts "#{item}(s) x#{quantity} was added to your basket"
  end

  def show_basket
    @basket.join << '0'
  end

  def total
    costs = []
    @basket.select do |element|
      costs.push(element) if element.is_a? Float
    end
    "£#{costs.inject(:+)}0"
  end

end




# I now have a hash, which I want to print as a string when I show the basket
