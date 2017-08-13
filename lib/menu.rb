require './lib/takeout'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = { :lasagna => 10,
                :pizza => 12,
                :burger => 10,
                :chips => 2 }
  end
end
