require_relative 'menu.rb'

class User
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

def view
  menu.dishes.last.map{ |dish, price| "#{dish} = £%0.2f" % [price] }
end

end

