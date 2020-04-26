require_relative 'menu'

class TakeAway

  attr_reader :menu, :basket, :total

  def initialize( menu = Menu.new )
   @menu = menu
   @basket = []
   @total = 0
  end

  def get_menu
    @menu.generator
  end

  def select( meal_number )
   @basket << @menu.list(meal_number )
  end

  def checkout
    calculator
    @total
  end

  def order
   p "Thank you! Your order was placed and will be delivered before 18:52"
 end


  private
    def calculator
      for i in 0...@basket.count
        @total = @basket[i][:price]
      end
    end

end
