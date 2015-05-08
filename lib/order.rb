require_relative './restaurant'
class Order
  attr_reader :order, :menu
  alias_method :list, :order
  def initialize(menu = nil)
    @menu = menu || default_menu
    @order = {}
  end

  def add(items)
    fail unless items.each_key.all? do |dish|
      menu.key?(dish)
    end
    order.merge!(items)
  end

  def default_menu
    Restaurant.new.menu
  end
end
