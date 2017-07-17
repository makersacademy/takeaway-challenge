class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    string = ""
    @dishes.each do |key, value|
      string += "#{key}".ljust(20)
      string += "#{'%.02f' % value}".rjust(10)
      string += "\n"
    end
    string
  end
end
