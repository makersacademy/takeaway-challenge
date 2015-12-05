require_relative 'menu'
class Takeaway

  attr_reader :menu

  def initialize(menu_klass = Menu.new)
    @menu_klass = menu
    @order = Hash.new
  end

  def order(item)
    "1* #{item} added to your basket"
  end


end
