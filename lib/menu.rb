class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    @dishes.each do |dish, price|
      puts "#{dish.capitalize}: £#{price}"
    end
  end

  def search(dish)
    raise "Sorry, #{dish} is not on the menu." unless check(dish)

    "#{dish.capitalize}: £#{@dishes[dish.to_sym]}"
  end

  private

  def check(dish)
    @dishes.keys.include?(dish.to_sym)
  end
end
