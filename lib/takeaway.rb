require_relative './checkout.rb'

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

  def order_total
    costs = []
    @basket.select do |element|
      costs.push(element) if element.is_a? Float
    end
    total = costs.inject(:+)
    puts "£#{total}0"
    total
  end

end
