require_relative './checkout.rb'

class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = {
      'bibimbap'=>10,
      'bulgogi'=>10,
      'naengmyeon'=>8
    }
    @basket = []
  end

  def add_to_basket(item)
    self.menu.map do |food, price|
      @basket.push("#{item}, #{price}") if item == food
    end
  end

end
