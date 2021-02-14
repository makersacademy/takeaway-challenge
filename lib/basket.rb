require './menu'
require './input_handler'
require './ui'


class Basket
 attr_reader :contents

  def initialize
    @contents = []
  end

  def add (item)
    @contents << item
  end

end
