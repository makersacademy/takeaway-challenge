require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
  end

  # def menu
  #   @dishes.dup
  # end

  def read
    @list = ""
    @dishes.each do |name, price|
      @list << "#{name} - £#{'%.2f' % price}\n"
    end
    @list
  end


  # private
  # attr_reader :dishes

end
