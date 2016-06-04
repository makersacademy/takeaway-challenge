class Dish

  attr_reader :menu

  def initialize
    @menu = { chicken: 3, pork: 4, tuna: 2, salmon: 3, beef: 5 }
  end

  def show_list
    @menu.each do | item, price|
      puts "#{item}: £#{price}"
    end
  end

end
