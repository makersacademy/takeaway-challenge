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
          if !@basket.include?(k)
              @basket[k] = [number, v * number]
          else
              @basket[k][0] += number
              @basket[k][1] += v * number
          end
          return "#{number} #{dish}(s) added to your basket"
      else
        return "apologies, that dish is not available"
      end
    end
  end

  def basket_summary
    @basket
  end
end
