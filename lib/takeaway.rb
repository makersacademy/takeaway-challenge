require_relative 'menu'

class Takeaway

    attr_reader :menu, :total

  def initialize(menu_klass = Menu.new)
    @menu = menu_klass
    @total = 0
  end

  def add(food, quantity = 1)
    @menu.add(food, quantity)
  end

  def checkout

  end
end