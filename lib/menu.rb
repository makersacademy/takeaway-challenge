class Menu

attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end


  def print
    dishes.map do |item, price|
       "#{item} £#{price}".capitalize
    end.join(", ")

  end
end
