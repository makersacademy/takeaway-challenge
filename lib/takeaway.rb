require_relative 'menu'
# require_relative 'price_list'

class Takeaway

  attr_reader :menu, :basket, :dishes, :text_provider
  attr_accessor :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = nil
    @basket = {}
    @text_provider = nil
  end

  def display
    @menu.display
  end

  def order(dish, number = 1)
    menu.price_list.each do |k, v|
      if k == dish
        @basket.include?(k) ? @basket[k] += v * number : @basket[k] = v * number
      else
        return "apologies that dish is not available"
      end
    end
  end
end
