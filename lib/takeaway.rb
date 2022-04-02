require_relative '../lib/menu'
class Takeaway
  attr_reader :menu_class

  def initialize(menu_class)
    @menu_class = menu_class
  end
  
end
