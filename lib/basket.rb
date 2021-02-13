require './menu'
require './input_handler'
require './ui'


class Basket
 attr_reader :menu

  def initialize
    @contents = []
  end

  def add (item)
    @contents << item
  end

end
