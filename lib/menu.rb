class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      '%s £%.2f' % [title.to_s.capitalize, price]
      # above syntex taken from online source - stackoverflow
    end.join(", ")
  end

  def price(dish)
    
  end
end