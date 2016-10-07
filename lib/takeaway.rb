#require_relative 'menu'

class Takeaway
  attr_reader :menu

def initialize(menu = nil)
  @menu = menu
end

def create_menu(food)
  @menu = food
end

end
