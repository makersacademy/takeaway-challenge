require_relative 'dish'

class Menu

  attr_reader :menu, :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
  end

  def read
    @list = ""
    @dishes.each do |name, price|
      @list << "#{name} - £#{'%.2f' % price}. "
    end
  @list
  end

end
