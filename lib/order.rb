require_relative 'menu'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_order(item)
    @basket << details(item)
    add_to_total(item)
  end

  private

  def details(item)
    Menu::MENU.select {|k,v| k == item.to_sym }
  end

  def add_to_total(item)
    @total += Menu::MENU[item.to_sym]
  end

end
