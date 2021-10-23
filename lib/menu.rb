require 'dish'

class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def display_dishes
    raise "empty menu" if dishes == []
    response = ""
    @dishes.each_index do |index|
      response += build_line(index)
    end
    response
  end

  def empty?
    @dishes.empty?
  end

  private def build_line(index)
    "#{index + 1} #{@dishes[index].description}:#{@dishes[index].price}\n"
  end
end
