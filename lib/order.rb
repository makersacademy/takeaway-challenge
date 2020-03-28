require_relative 'menu'

class Order

  attr_reader :menu

  def initialize
    @menu = Menu.new.list
  end

end
