require './lib/dish'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add(dish)
    @menu << { name: dish.name, price: dish.price }
  end

  def list
    @menu.each do |dish| 
      puts "#{dish[:name]} \£#{dish[:price]}"
    end
  end
end
