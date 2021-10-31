require './lib/menu'
require './lib/dish'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

end


