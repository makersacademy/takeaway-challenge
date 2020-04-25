require_relative 'menu'

class TakeAway

  attr_reader :menu, :basket, :total

  def initialize( menu = Menu.new )
   @menu = menu
   @basket = []
   @total = 0
  end

  def get_menu
    p "Tanil's Restaurant Menu List:"
    @menu.generator
  end

  def select( meal_number )
   @basket << @menu.list[ meal_number - 1 ]
  end

  def checkout
    calculator
    @total
  end


  private
    def calculator
      for i in 0...@basket.count
        @total += @basket[i][:price]
      end
    end

end
